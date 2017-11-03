class CreateSightings < ActiveRecord::Migration[5.1]
  def change
    create_table :sightings do |t|
      t.integer :user_id
      t.integer :bird_id
      t.string :location
      t.string :time_date
      t.string :description
    end
  end
end
