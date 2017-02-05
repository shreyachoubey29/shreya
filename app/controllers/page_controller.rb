class PageController < ApplicationController
  def new
    
    @apage = Page.new
    
    
  end
  
  def create 
    @page = Page.new{page_params}
    if @page.save
      flash[:notice] = "Article was sucessfully created"
      redirect_to page_path(@page)
      
    else
      render 'new'
    end
  end
  
  def show 
    @page = Page.find(params[:id])
    
  end
  
  private def page_params
      
      params.require(:page).permit(:title, :description)
      redirect_to page_path(@page)
    end
  
end