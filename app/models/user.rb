class User < ApplicationRecord
  has_many :organization_members, foreign_key: :member_id
  has_many :organizations, through: :organization_members
  has_many :reviews, foreign_key: :writer_id
  has_many :project_members, foreign_key: :member_id
  has_many :projects, through: :project_members
  has_many :tasks, foreign_key: :leader_id

  validates :name, :email, presence: true
end
