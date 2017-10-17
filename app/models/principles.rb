class Principle < ActiveRecord::Base
  belongs_to :organization

  validates :principle, :description, :organization_id, presence: true
end
