class LibrariesController < ApplicationController
  def index
    @libraries = Library.all 
    respond_to do |f|   
      f.html
      f.json { render json: @libraries.to_json(only: [:url]) }
    end
  end

  def show
    @library = Library.find(id)
    respond_to do |f|   
      f.html
      f.json {render json: { libraries: @libraries.as_json(only: [:url])} }
    end
  end

  def new
    @library = Library.new
    respond_to do |f|
      f.html
      f.json { render json: {}, status: 404 }
    end
  end

  def create
    l = Library.find_by_url(params[:library][:url])
    l.destroy if 1
    library = Library.new(library_params)
    if library.save
      GetLibraries.perform_async(library.url)
      GetLibraries.perform_async(library.id)
      redirect_to "/adventures"
    else
      redirect_to "new"
    end
  end

  private

    def library_params
      params.require(:library).permit(:url)
    end

    def id
      params[:id]
    end
end
