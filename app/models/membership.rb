class Membership < ApplicationRecord
  belongs_to :member, class_name: "User"
  belongs_to :organization

  validates :organization_id, :member_id, presence: true
end
