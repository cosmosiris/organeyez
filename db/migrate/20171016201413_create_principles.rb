class CreatePrinciples < ActiveRecord::Migration[5.1]
  def change
    create_table :principles do |t|
      t.string   :principle, null: false
      t.string   :description, null: false
      t.references  :organization, null: false

      t.timestamps
    end
  end
end
