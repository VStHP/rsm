class ClubsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource except: :create
  before_action :load_club, only: %i(edit update destroy)
  before_action :load_author_create, only: %i(create)

  def new
    @club = Club.new
  end

  def create
    respond_to do |format|
      if @club.save
        format.js{flash[:success] = t ".create_success"}
      else
        format.js{}
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @club.update_attributes params_club
        format.js{flash[:success] = t ".update_success"}
      else
        format.js{}
      end
    end
  end

  def destroy
    respond_to do |format|
      if @club.destroy
        format.js{flash[:success] = t ".destroy_success"}
      else
        format.js{flash[:danger] = t ".destroy_fail"}
      end
    end
  end

  private

  def params_club
    club_param = params.require(:club).permit :name, :content, :current, :start_time, :end_time,
      :position, :user_id
    club_param[:start_time] = format_date club_param[:start_time]
    club_param[:end_time] = format_date club_param[:end_time]
    club_param
  end

  def format_date value
    return if value.blank?
    Date.strptime(value, Settings.date_format)
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
