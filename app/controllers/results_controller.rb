class ResultsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @results = Result.all
  end

  def new
    @result = Result.new
  end

  def create
    @result = Result.new(result_params)
    @result.user = current_user
    if @result.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    result = Result.find(params[:id])
    result.destroy
  end

  private

  def result_params
    params.require(:result).permit(:date, :game_name, :event_id, :result)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end