class CreateCamps < ActiveRecord::Migration[7.0]
  def change
    create_table :camps do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.integer :price, null: false, default: 0
      t.integer :number_of_guests, null: false, default: 0
      t.integer :number_of_tents, null: false, default: 0
      t.timestamps
    end
  end
end
