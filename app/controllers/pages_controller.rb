class PagesController < ApplicationController

  def index
    @new_page = Page.new
  end

  def show
    @page = Page.find(params[:id])
  end

  def create
    @new_page = Page.new(params[:page])

    respond_to do |format|
      format.html do
        if @new_page.save
          redirect_to root_path
        else
          render :index
        end
      end
    end
  end

end
