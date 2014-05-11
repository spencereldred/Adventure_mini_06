require 'spec_helper'

describe LibrariesController do

  # describe "GET 'index'" do
  #   it "returns http success" do
  #     get 'index'
  #     response.should be_success
  #   end
  # end

  render_views

  describe "GET 'show'" do
    before do
      @library = Library.create(url: "google.com")  
    end
    it "returns http success for html" do
      get 'show', { id: @library.id}
      response.should be_success
    end
    it "includes the library" do 
      get "show", { id: @library.id }
      response.body.should include @library.url.to_s
    end
    it "returns http success for json" do 
      get 'show', { id: @library.id}, { format: :json }
      response.status.should == 200
    end
    it "includes library for json" do 
      get 'show', { id: @library.id, format: :json}
      response.body.should include @library.to_json
    end
  end

  # describe "GET 'new'" do
  #   it "returns http success" do
  #     get 'new'
  #     response.should be_success
  #   end
  # end

end
