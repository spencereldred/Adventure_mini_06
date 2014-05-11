class LibrariesController < ApplicationController
  def index
    @libraries = Library.all 
    respond_to do |f|   
      f.html
      f.json { render json: @libraries.to_json(except: [:id]) }
    end
  end

  def show
    @library = Library.find(id)
    respond_to do |f|   
      f.html
      f.json {render json: @library.to_json(except: [:id]) }
    end
  end

  def new
    @library = Library.new
    respond_to do |f|
      f.html
      f.json { render json: {}, status: 404 }
    end
  end

  private
    def id
      params[:id]
    end
end
