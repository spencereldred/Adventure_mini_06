class AdventuresController < ApplicationController
  def index
    @adventures = Adventure.all  
    respond_to do |f| 
      f.html
      f.json { render json: @adventures.to_json }
    end
  end

  def show
    @adventure = Adventure.find(id)
    respond_to do |f| 
      f.html
      f.json { render json: @adventure.to_json }
    end
  end

  def edit
  end

  private
  
    def id
      params[:id]
    end
end
