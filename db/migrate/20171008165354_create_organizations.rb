class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string   :name, null: false
      t.string   :email, null: false
      t.string   :password_hash
      t.integer  :code

      t.timestamps
    end
  end
end
