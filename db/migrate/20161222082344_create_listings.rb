class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :address
      t.integer :guess_number
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
