class AdventuresController < ApplicationController
  def index
    @adventures = Adventure.all.where(library_id: library_id)  
    respond_to do |f| 
      f.html
      f.json { render json: @adventures.to_json(include: :pages) }
    end
  end

  def show
    @adventure = Adventure.find(id)
    respond_to do |f| 
      f.html
      f.json { render json: @adventure.to_json }
    end
  end

  def new
    @adventure = Adventure.new
    respond_to do |f|
      f.html
      f.json { render json: {}, status: 404}   
    end
  end

  def edit
    @adventure = Adventure.find(id)
    respond_to do |f| 
      f.html
      f.json { render json: {}, status: 404}
    end
  end

  private

    def library_id
      params[:library_id]
    end

    def id
      params[:id]
    end
end
