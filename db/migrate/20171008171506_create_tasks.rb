class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string   :name, { null: false, limit: 50 }
      t.integer  :project_id, { null: false }
      t.integer  :leader_id, { null: false }
      t.string   :message, { null: false }

      t.timestamps
    end
  end
end
