class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string   :name, limit: 50, default: ""
      t.string   :description, default: ""
      t.text     :notes, default: ""
      t.references  :project
      t.references  :leader

      t.timestamps
    end
  end
end
