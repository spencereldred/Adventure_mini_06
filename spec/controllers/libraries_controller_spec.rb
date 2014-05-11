require 'spec_helper'

describe LibrariesController do

  describe "GET 'index'" do
    before do
      @libraries = []
      for i in 1..5 do 
        @libraries << Library.create(url: "google.com#{i}")
      end
    end
    it "returns http success for html" do
      get 'index'
      response.status.should == 200
    end
    it "includes libraries" do 
      get 'index'
      response.body.should include(@libraries[0].url)
      response.body.should include(@libraries[3].url)
    end
    it "returns http success for json" do
      get 'index', { format: :json }
      response.status.should == 200
    end
    it "includes libraries for json" do 
      get 'index', { format: :json }
      response.body.should include @libraries[3].to_json
      response.body.should include @libraries[1].to_json
    end
  end

  render_views

  describe "GET 'show'" do
    before do
      @library = Library.create(url: "google.com")  
    end
    it "returns http success for html" do
      get 'show', { id: @library.id, format: :json}
      response.status.should == 200
    end
    it "includes the library for json" do 
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

  describe "GET 'new'" do
    it "returns http success for html" do
      get 'new'
      response.status.should == 200
    end
    it "returns 404 for json" do 
      get 'new', { format: :json }
      response.status.should == 404
    end
  end

end
