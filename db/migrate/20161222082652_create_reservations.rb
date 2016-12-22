class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :guest_id
      t.integer :listing_id
      t.integer :total_price
      t.integer :timeframes

      t.timestamps null: false
    end
  end
end
