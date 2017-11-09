class AddSummaryToBird < ActiveRecord::Migration[5.1]
  def change
    add_column :birds, :summary, :string
  end
end
