class AddDatetimeToSightings < ActiveRecord::Migration[5.1]
  def change
    add_column :sightings, :datetime, :string
  end
end
