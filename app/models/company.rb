class Company < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :jobs, dependent: :destroy
  has_many :members, dependent: :destroy
  has_many :passive_report, class_name: Report.name, as: :reported, dependent: :destroy
  has_many :passive_follow, class_name: Relationship.name, as: :followed, dependent: :destroy
end
