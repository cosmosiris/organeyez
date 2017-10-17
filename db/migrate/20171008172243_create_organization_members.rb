class CreateOrganizationMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :organization_members do |t|
      t.references  :organization,  null: false
      t.references  :member,  null: false

      t.timestamps
    end
  end
end
