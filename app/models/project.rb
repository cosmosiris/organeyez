class Project < ApplicationRecord
  belongs_to :organization
  has_many :tasks
  has_many :reviews
  has_many :members, {through: :project_members}

  validates :name, :organization_id, :start_date, :end_date, {presence: true}
end

