class ClubsController < ApplicationController
  before_action :load_club, only: %i(edit update destroy)

  def new
    @club = Club.new
  end

  def create
    @club = Club.new params_club
    if @club.save
      respond_to do |f|
        f.js { flash[:success] = t ".create_success"}
      end
    else
      respond_to do |f|
        f.js { flash[:danger] = t ".create_fail"}
      end
    end
  end

  def edit
  end

  def update
    if @club.update_attributes params_club
      respond_to do |f|
        f.js { flash[:success] = t ".update_success"}
      end
    else
      respond_to do |f|
        f.js { flash[:danger] = t ".update_fail"}
      end
    end
  end

  def destroy
    if @club.destroy
      respond_to do |f|
        f.js { flash[:success] = t ".destroy_success"}
      end
    else
      respond_to do |f|
        f.js { flash[:danger] = t ".destroy_fail"}
      end
    end
  end

  private

  def params_club
    params[:club][:user_id] = 1
    params.require(:club).permit(:name, :content, :current, :start_time, :end_time,
      :position, :user_id)
  end

  def load_club
    @club = Club.find_by id: params[:id]
  end
end
