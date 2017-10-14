class CreateProjectMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :project_members do |t|
      t.integer  :project_id, { null: false}
      t.integer  :member_id, { null: false }

      t.timestamps
    end
  end
end

