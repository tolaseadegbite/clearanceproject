class CreateClearances < ActiveRecord::Migration[7.0]
  def change
    create_table :clearances do |t|
      t.string :link
      t.belongs_to :user, null: false, foreign_key: true
      t.string :degree

      t.timestamps
    end
  end
end
