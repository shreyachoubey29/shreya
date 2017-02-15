class PagesController < ApplicationController
  
  before_action  :set_page, only: [:edit, :update, :show , :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]


  def new
    
    @page = Page.new
  end
    
  def index 
    @pages = Page.paginate(page: params[:page], per_page:5)
  end
    
  def create 
    
  @page = Page.new(page_params)
  @page.user = current_user
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
      params.require(:page).permit(:title, :description, category_ids: [])
    end
    
    def set_page
    
    @page = Page.find(params[:id])
    end
    
    def require_same_user
      if current_user!= @page.user and  !current_user.admin?
        flash[:danger]= "You can edit or delete only your article"
        redirect_to root_path
      end
    end
    
end