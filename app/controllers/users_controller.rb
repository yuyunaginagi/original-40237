class UsersController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @users = User.all
    @results = Result.all
  end

  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @results = @user.results.order(date: :desc)
    @reviews = @user.reviews.order(date: :desc)
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :birth_day, :event, :goal)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
