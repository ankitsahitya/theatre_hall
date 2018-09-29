class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, index: true, foreign_key: true
      t.references :show, index: true, foreign_key: true
      t.references :theater, index: true, foreign_key: true
      t.integer :no_of_seats
      t.integer :total_price
    end
  end
end
