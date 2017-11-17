module ClubsHelper
  def load_endtime club
    if club.current?
      @end = I18n.t("clubs.helpers.present")
    else
      club.end_time
    end
  end
end
