class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user, only: %i(show)

  def show
    @clubs = @user.clubs
  end

  private

  def load_user
    @user = User.find_by params[:id]
    return if @user
    flash[:danger] = t "users.not_found"
    redirect_to root_path
  end
end
