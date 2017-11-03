class CreateBirds < ActiveRecord::Migration[5.1]
  def change
    create_table :birds do |t|
      t.string :species
    end
  end
end
