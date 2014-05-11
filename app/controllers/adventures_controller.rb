class AdventuresController < ApplicationController
  def index
    @adventures = Adventure.all.where(library_id: library_id)  
    @otherAdventures = Adventure.all.where.not(library_id: library_id)
    respond_to do |f| 
      f.html
      f.json { render json: 
        { adventures: 
          @adventures.as_json(except: [:id, :created_at], 
            include: [pages: { except: [:id, :adventure_id, :created_at] } ]
              ) } }    
    end
  end

  def show
    @adventure = Adventure.find(id)
  end

  def new
    @adventure = Adventure.new
    respond_to do |f|
      f.html
      f.json { render json: {}, status: 404}   
    end
  end

  def create
    @adventure = Adventure.create(adventure_params)
  end

  def edit
    @adventure = Adventure.find(id)
    respond_to do |f| 
      f.html
      f.json { render json: {}, status: 404}
    end
  end

  private

    def adventure_params
      params.require(:adventure).permit(:title, :author)
    end

    def library_id
      params[:library_id]
    end

    def id
      params[:id]
    end
end
