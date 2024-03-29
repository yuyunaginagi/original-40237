class UsersController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @results = @user.results
  end
  
  private

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
