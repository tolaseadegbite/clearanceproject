class AddAttributesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :state, :string
    add_column :users, :nationality, :string
    add_column :users, :gender, :string
    add_column :users, :level, :string
    add_column :users, :birth_date, :date
    add_column :users, :department, :string
    add_column :users, :duration, :integer
    add_column :users, :year, :bigint
  end
end
