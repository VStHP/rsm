class Achievement < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: {maximum: Settings.achievement.name_max_length}
  validates :majors, presence: true, length: {maximum: Settings.achievement.major_max_length}
  validates :organization, presence: true, length: {maximum: Settings.achievement.organization_max_length}
  validates :received_time, presence: true
  validate :date_less_than_today, if: :received_time?

  private

  def date_less_than_today
    errors.add :received_time, I18n.t("validates.receive_time_future") if received_time > Time.zone.today
  end
end
