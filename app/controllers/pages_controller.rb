class PagesController < ApplicationController
  
  def index
  end

  def show
    @page = Page.find(id)
  end

  def edit
  end

  def new
  end

  private

    def id
      params[:id]
    end

end
