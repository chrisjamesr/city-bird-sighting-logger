class AddBirdImageUrlColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :birds, :image_url, :string
  end
end
