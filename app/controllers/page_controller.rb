class PageController < ApplicationController
  def new
    
    @apage = Page.new
    
    
  end
  
  def create 
    @page = Page.new{page_params}
    @page.save
  end
  
  
  private def page_params
      
      params.require(:page).permit(:title, :description)
      redirect_to page_path(@page)
    end
  
end