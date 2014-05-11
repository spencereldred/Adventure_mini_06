require 'net/http'
 class GetLibraries
 
   include Sidekiq::Worker
   sidekiq_options :retry => false
   def perform(url)
     uri = URI.parse(url  "libraries.json")
     response = Net::HTTP.get(uri)
     result = JSON.parse(response)['libraries']
     result.each do |u|
       Library.create(url: u["url"]) if !Library.find_by_url(u["url"])
       GetAdventures.perform_async(Library.find_by_url(u['url']).id)
     end
   end
 end