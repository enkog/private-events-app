class SessionsController < ApplicationController
  def new  

  end

  def create
    p "incoming parameters"
    p params
    user = User.find_by(name: params[:session][:name])
    if user&.authenticate(params[:session][:password])
        flash[:info] = "Hello #{user.name}"
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        flash[:danger] = "Wrong password or username"
        render :new
      end
    end

  def destroy
    session[:user_id] = nil
    flash[:info] = "You have logged out"
    redirect_to root_path
  end
end