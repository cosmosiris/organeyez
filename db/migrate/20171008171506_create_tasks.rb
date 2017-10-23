class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string   :name, { null: false, limit: 50 }
      t.string   :description
      t.text     :notes
      t.references  :project, { null: false }
      t.references  :leader, { null: false }

      t.timestamps
    end
  end
end
