class Task < ApplicationRecord
  belongs_to :project
  belongs_to :leader, {class_name: "User"}
  has_many :steps

  validates :name, :project_id, :leader_id, {presence: true}
end
