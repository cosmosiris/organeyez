class ProjectMember < ApplicationRecord
  belongs_to :member, class_name: "User"
  belongs_to :project

  validates :project_id, :member_id, {presence: true}

end
