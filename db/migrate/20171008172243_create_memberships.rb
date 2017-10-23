class CreateMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :memberships do |t|
      t.references  :organization,  null: false
      t.references  :member,  null: false

      t.timestamps
    end
  end
end
