class CreateCamps < ActiveRecord::Migration[7.0]
  def change
    create_table :camps do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.string :address
      t.integer :price
      t.integer :capacity
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
