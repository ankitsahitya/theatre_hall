class CreateShows < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
      t.references :audi, index: true, foreign_key: true
      t.references :movie, index: true, foreign_key: true
      t.time :time
      t.date :date
      t.integer :available_seats
    end
  end
end
