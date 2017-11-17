module ClubsHelper
  def load_endtime club
    if club.current?
      @end = I18n.t("clubs.helpers.present")
    else
      @end = club.end_time
    end
  end
end
