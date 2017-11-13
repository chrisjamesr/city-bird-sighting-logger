class AddDatetimeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :member_since, :datetime
  end
end
