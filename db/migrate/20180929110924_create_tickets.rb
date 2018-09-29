class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.integer :booking_id
      t.integer :movie_id
      t.integer :audi_id
      t.integer :seat_no
      t.decimal :price
    end
  end
end
