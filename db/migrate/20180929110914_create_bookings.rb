class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :show_id
      t.integer :theatre_id
      t.integer :no_of_seats
      t.integer :total_price
    end
  end
end
