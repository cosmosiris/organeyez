class CreateSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :steps do |t|
      t.integer  :task_id, { null: false}
      t.integer  :step_number, { null: false}
      t.string   :description, { null: false }
      t.string   :status, { null: false }

      t.timestamps
    end
  end
end
