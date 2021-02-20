class SessionsController < ApplicationController
  def new  

  end

  def create
    user = User.find_by(name: params[:name])
        if user
          session[:user_id] = user.id
          flash[:info] = "Hello #{user.name}"
          redirect_to user_path(user)
        else
          flash[:danger] = "Something is wrong with your login information"
          render :new
        end
    end

  def destroy
    session[:user_id] = nil
    flash[:info] = "You have logged out"
    redirect_to root_path
  end
end