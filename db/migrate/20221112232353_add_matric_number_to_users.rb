class AddMatricNumberToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :matric_number, :string
  end
end
