class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string   :name, { null: false, limit: 50 }
      t.string   :email, { null: false }

      t.timestamps
    end
  end
end
