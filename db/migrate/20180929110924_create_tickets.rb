class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.references :booking, index: true, foreign_key: true
      t.references :movie, index: true, foreign_key: true
      t.references :audi, index: true, foreign_key: true
      t.integer :seat_no
      t.decimal :price
    end
  end
end
