class Club < ApplicationRecord
  belongs_to :user, optional: true
  validates :name, presence: true, length: {maximum: Settings.clubs.model.name_max_length}
  validates :user_id, presence: true
  validates :position, presence: true, length: {maximum: Settings.clubs.model.pos_max_length}
  validates :start_time, presence: true
  validates :end_time, presence: true, unless: :current?
  validates :content, length: {maximum: Settings.clubs.model.cont_max_length, minimum:
    Settings.clubs.model.cont_min_length}, if: :content?
  validate :date_less_than_today
  validate :end_date_after_start_date, unless: :current?
  scope :of_user, ->(user_id){where user_id: user_id}

  private

  def end_date_after_start_date
    return if end_time.blank? || start_time.blank?
    errors.add :end_time, I18n.t("clubs.model.date1") if end_time < start_time
  end

  def date_less_than_today
    unless end_time.blank? || current == Settings.clubs.model.current_true
      errors.add :end_time, I18n.t("clubs.model.date1") if end_time > Time.zone.today
    end
    return if start_time.blank?
    errors.add :start_time, I18n.t("clubs.model.date1") if start_time > Time.zone.today
  end
end
