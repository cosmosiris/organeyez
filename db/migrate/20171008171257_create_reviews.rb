class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer  :project_id, { null: false }
      t.integer  :writer_id, { null: false }
      t.string   :message, { null: false }

      t.timestamps
  end
end