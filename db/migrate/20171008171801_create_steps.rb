class CreateSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :steps do |t|
      t.references  :task, { null: false}
      t.string    :step_number, { null: false}
      t.string   :description, { null: false }
      t.string   :status, { null: false }

      t.timestamps
    end
  end
end
