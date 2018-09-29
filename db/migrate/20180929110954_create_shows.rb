class CreateShows < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
      t.integer :audi_id
      t.integer :movie_id
      t.time :time
      t.date :date
      t.integer :available_seats
    end
  end
end
