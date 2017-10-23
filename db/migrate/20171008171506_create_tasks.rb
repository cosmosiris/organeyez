class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string   :name, { null: false, limit: 50 }
      t.references  :project, { null: false }
      t.references  :leader, { null: false }
      t.string   :message, { null: false }

      t.timestamps
    end
  end
end
