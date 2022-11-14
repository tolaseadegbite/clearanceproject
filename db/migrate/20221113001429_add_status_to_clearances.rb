class AddStatusToClearances < ActiveRecord::Migration[7.0]
  def change
    add_column :clearances, :status, :string, default: "Pending"
  end
end
