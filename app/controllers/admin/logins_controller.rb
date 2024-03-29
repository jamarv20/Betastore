class Admin::LoginsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.try.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome Back"
      redirect_to admin_products_path

    else
      flash.now[:danger] = 'Log In Failed'
      render 'new'
    end
  end  
end

  