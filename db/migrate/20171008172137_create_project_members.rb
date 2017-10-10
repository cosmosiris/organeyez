class CreateProjectMembers < ActiveRecord::Migration
  def change
    create_table :project_members do |t|
      t.integer  :project_id, { null: false}
      t.integer  :member_id, { null: false }

      t.timestamps
    end
  end
end

