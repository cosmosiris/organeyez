class CreateProjectMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :project_members do |t|
      t.references  :project, { null: false}
      t.references  :member, { null: false }

      t.timestamps
    end
  end
end

