class ProfilesController < ApplicationController
  def index
    @clubs = Club.of_user 1
  end
end
