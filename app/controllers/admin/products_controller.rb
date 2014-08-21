class Admin::ProductsController < ApplicationController
 
before_action :require_login


  def index
    if logged_in?
      @products = Product.order('name').all
    else
      redirect_to admin_login_path, alert: 'Please log in to continue'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params.require(:product).permit!)
    if @product.save
      redirect_to admin_products_path, notice: "Product #{@product.id} was created"
    else
      render 'new'
    end
  end

  def update
    @product = Product.new(params.require(:product).permit!)
    if @product.save
      redirect_to admin_products_path, notice: "Product #{@product.id} was updated"
    else
      render 'edit'  
    end
  end
      
  def edit
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id]) 
    @product.destroy
    redirect_to admin_products_path, notice: "Product #{@product.id} was deleted"
  end

  private

    def logged_in?
      session[:user_id].present?
    end

    def product_params
      params.require(:product).permit!(:name, :price, :image_url, :description)
    end
    
    def require_login
      unless logged_in?
        redirect_to admin_login_path, danger: 'Please log in to continue'
      end
    end
  
end 