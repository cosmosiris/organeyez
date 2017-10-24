class CreateSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :steps do |t|
      t.string    :step_number, { null: false}
      t.string   :description, { null: false }
      t.text     :notes
      t.string   :status, { null: false }
      t.references  :task, { null: false}

      t.timestamps
    end
  end
end
