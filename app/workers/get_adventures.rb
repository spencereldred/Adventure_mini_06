require 'sidekiq/testing'
 Sidekiq::Testing.inline!
 class GetAdventures
 
   include Sidekiq::Worker
   sidekiq_options :retry => false
   def perform (id)
     begin
       library = Library.find(id)
     rescue
       puts "oops"
     else
       url = URI.parse(library.url  "adventures.json")
       begin
         response = Net::HTTP.get(url)
         result = JSON.parse(response)['adventures']
       rescue
         puts "oops"
       else
         result.each do |a|
           adventure_found = Adventure.find_by_guid(a['guid'])
           if adventure_found
             adventure_found.destroy
           end
           adv = Adventure.create(title: a['title'], author: a['title'], library_id: id, guid: a['guid'])
           binding
           a['pages'].each do |p|
             adv.pages.create(name: p['name'], text: p['text'])
           end
         end
       end
     end
   end
 end