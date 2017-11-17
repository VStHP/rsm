class ClubsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_club, only: %i(edit update destroy)
  before_action :load_author_create, only: %i(create)
  load_and_authorize_resource except: :create

  def new
    @club = Club.new
  end

  def create
    if @club.save
      respond_to do |f|
        f.js{flash[:success] = t ".create_success"}
      end
    else
      respond_to do |f|
        f.js{flash[:danger] = t ".create_fail"}
      end
    end
  end

  def edit; end

  def update
    if @club.update_attributes params_club
      respond_to do |f|
        f.js{flash[:success] = t ".update_success"}
      end
    else
      respond_to do |f|
        f.js{flash[:danger] = t ".update_fail"}
      end
    end
  end

  def destroy
    if @club.destroy
      respond_to do |f|
        f.js{flash[:success] = t ".destroy_success"}
      end
    else
      respond_to do |f|
        f.js{flash[:danger] = t ".destroy_fail"}
      end
    end
  end

  private

  def params_club
    params.require(:club).permit :name, :content, :current, :start_time, :end_time,
      :position, :user_id
  end

  def load_club
    @club = Club.find_by id: params[:id]
    return if @club
    flash[:danger] = t "clubs.another.club_notfound"
    redirect_to profile_path
  end

  def load_author_create
    @club = Club.new params_club
    authorize! :create, @club
  end
end
