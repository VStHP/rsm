class Club < ApplicationRecord
  belongs_to :user, optional: true
  validates :name, presence: true, length: {maximum: 150}
  validates :position, presence: true, length: {maximum: 100}
  validates :start_time, presence: true
  validates :end_time, presence: true, unless: :current?
  validates :content, length: {maximum: 5000, minimum: 20}, if: :content?
  validate :date_less_than_today?
  validate :end_date_after_start_date?, unless: :current?
  scope :of_user, -> (user_id){ where user_id: user_id }

  def end_date_after_start_date?
    return if end_time.blank? || start_time.blank?
    if end_time < start_time
      errors.add :end_time, "must be after start date"
    end
  end

  def date_less_than_today?
    unless end_time.blank?
      errors.add :end_time, "can't be a date in future" if end_time > Date.today
    end
    unless start_time.blank?
      errors.add :start_time, "can't be a date in future" if start_time > Date.today
    end
  end
end
