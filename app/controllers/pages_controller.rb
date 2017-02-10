class PagesController < ApplicationController
  
  before_action  :set_page, only: [:edit, :update, :show , :destroy]
  def new
    
    @page = Page.new
  end
    
  def index 
    @pages = Page.all
  end
    
  
  
  def create 
    
  @page = Page.new(page_params)
  @page.user = User.first
  if @page.save
  flash[:success] = "Article was successfully created"
  redirect_to page_path(@page)
  else
  render 'new'
  end
  end
  
  def show 

  end
  
  def edit
    @page = Page.find{params[:id]}
  
  end
  
  def update
    
    if @page.update(page_params)
      flash[:success] = "Article was sucessfully updated"
      redirect_to page_path(@page)
    else
      render 'edit'
    end
  end
  
  def destroy 
    
    @page.destroy
    flash[:danger] = "Article was succesfully deleted"
    redirect_to pages_path
    
    
  end
    
  
  private
  
    def page_params

        params.require(:page).permit(:title, :description)

    end
      
      
     
  
    def set_page
    
    @page = Page.find(params[:id])
    end
    
end