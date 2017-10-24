class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string   :message, { null: false }
      t.references  :project, { null: false }
      t.references  :writer, { null: false }

      t.timestamps
    end
  end
end
