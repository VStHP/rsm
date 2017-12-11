module ClubsHelper
  def show_endtime club
    if club.current?
      t "clubs.helpers.present"
    else
      I18n.l club.end_time, format: :long_profile
    end
  end

  def define_cancel_club_id club
    if club.id?
      "cancel_club_edit"
    else
      "cancel_club_new"
    end
  end
end
