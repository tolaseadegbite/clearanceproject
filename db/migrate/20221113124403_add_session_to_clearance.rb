class AddSessionToClearance < ActiveRecord::Migration[7.0]
  def change
    add_column :clearances, :session, :string
  end
end
