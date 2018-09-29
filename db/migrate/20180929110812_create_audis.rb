class CreateAudis < ActiveRecord::Migration[5.2]
  def change
    create_table :audis do |t|
      t.integer :number
      t.integer :no_of_seats
      t.integer :price_of_seat
      t.integer :theatre_id
    end
  end
end
