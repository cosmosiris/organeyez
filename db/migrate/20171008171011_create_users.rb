class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string   :name, { null: false, limit: 50 }
      t.string   :email, { null: false }

      t.timestamps
    end
  end
end
