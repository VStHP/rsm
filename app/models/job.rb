class Job < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :applies, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  has_many :bookmark_likes, dependent: :destroy
  has_many :reward_benefits, dependent: :destroy
end
