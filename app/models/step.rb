class Step < ApplicationRecord
  belongs_to :task

  validates :step_number, :task_id, :description, :status, {presence: true}
end
