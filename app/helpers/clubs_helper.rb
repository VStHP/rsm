module ClubsHelper
  def show_endtime club
    if club.current?
      @date_end = I18n.t "clubs.helpers.present"
    else
      club.end_time
    end
  end
end
