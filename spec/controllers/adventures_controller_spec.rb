require 'spec_helper'

describe AdventuresController do

  render_views

  describe "GET 'index'" do
    it "returns http success for html" do
      get 'index'
      response.should be_success
    end
    before do
      @adventures = []
      for i in 1..5 do
        @adventures << Adventure.create!(:title => "#{i} Test Adventure", :author => "person #{i}")
      end
    end
    it "displays a list of adventures for html" do 
      get 'index'
      response.body.should include @adventures[1].title
      response.body.should include @adventures[3].author
    end
    it "returns http success for json" do 
      get 'index', { format: :json }
      response.should be_success
    end
    before do
       @adventures = []
       for i in 1..5 do
         @adventures << Adventure.create!(:title => "#{i} Test Adventure", :author => "person #{i}")
       end
     end
     it "returns a list of adventures for json" do 
       get 'index', {format: :json}
       response.body.should include @adventures[1].title.to_json
       response.body.should include @adventures[3].author.to_json
     end
   end
 
   describe "GET 'show'" do
     before do
       i = 1
       @adventure = Adventure.create!(:title => "#{i} show Test Adventure", :author => " show person #{i}")
     end
     it "returns http success for html" do
       get 'show', {id: @adventure.id}
       response.should be_success
     end
     before do
       i = 2
       @adventure = Adventure.create!(:title => "#{i} show Test Adventure", :author => " show person #{i}")
     end
     it "includes the adventure" do
       get 'show', {id: @adventure.id}
       response.body.should include(@adventure.title)
     end
   end
  
  end

  # describe "GET 'show'" do
  #   it "returns http success" do
  #     get 'show'
  #     response.should be_success
  #   end
  # end

#   describe "GET 'edit'" do
#     it "returns http success" do
#       get 'edit'
#       response.should be_success
#     end
#   end

# end
