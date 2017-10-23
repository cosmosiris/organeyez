class AddMissionToOrganizations < ActiveRecord::Migration[5.1]
  def change
    add_column :organizations, :mission, :text, default:
    ""
  end
end
