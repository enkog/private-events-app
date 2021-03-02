class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to P-EVENTS #{@user.name}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @past_events = @user.past_events
    @upcoming_events = @user.upcoming_events
    @created_events = @user.created_events
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
