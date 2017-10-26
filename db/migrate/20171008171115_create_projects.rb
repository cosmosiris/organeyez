class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string   :name, { null: false, limit: 50 }
      t.string   :start_date, { null: false }
      t.string   :end_date, { null: false }
      t.string   :status, {null: false}
      t.references  :organization, { null: false }


      t.timestamps
    end
  end
end
