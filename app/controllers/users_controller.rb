class UsersController < ApplicationController

  def show
    @nickname  =current_user.nickname
    @results = current_user.results
  end

end
