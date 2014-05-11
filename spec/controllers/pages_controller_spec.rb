require 'spec_helper'

describe PagesController do
  render_views
  
  describe "GET 'show'" do
    before do
      name = "Pages test"
      @adv = Adventure.create!(:title => "#{name}'s Test Adventure", :author => name)
      @page = @adv.pages.create!(:name => "start", :text => "This is a great text adventure which is beginning right now! I can't wait to [[see the end|end]]")
      @adv.pages.create!(:name => "end", text: "The End")
    end 

    it "returns http success" do
      get 'show', { id: @page.id, adventure_id: @adv.id }
      response.should be_success
    end

    it "displays the page linkified" do 
      get 'show', { id: @page.id, adventure_id: @adv.id }
      response.should be_success
      response.body.should include("/pages/")
    end
  end

  # describe "GET 'edit'" do
  #   it "returns http success" do
  #     get 'edit'
  #     response.should be_success
  #   end
  # end

#   describe "GET 'new'" do
#     it "returns http success" do
#       get 'new'
#       response.should be_success
#     end
#   end

end
