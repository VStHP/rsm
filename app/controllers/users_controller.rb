class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @clubs = Club.of_user params[:id]
  end

end
