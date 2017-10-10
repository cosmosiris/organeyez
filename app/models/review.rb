class Review < ApplicationRecord
  belongs_to :project
  belongs_to :writer, {class_name: "User"}

  validates :project_id, :writer_id, :message, {presence: true}
end
