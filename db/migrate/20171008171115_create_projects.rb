class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string   :name, { null: false, limit: 50 }
      t.integer  :organization_id, { null: false }
      t.string   :start_date, { null: false }
      t.string   :end_date, { null: false }


      t.timestamps
  end
end
