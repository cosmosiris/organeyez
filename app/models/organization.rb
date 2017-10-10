class Organization < ApplicationRecord
  has_many :projects
  has_many :organization_members
  has_many :members, {through: :organization_members}
  validates :name, :email, {presence: true}
end
