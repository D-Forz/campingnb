class CreateCamps < ActiveRecord::Migration[7.0]
  def change
    create_table :camps do |t|
      t.string :title
      t.text :content
      t.integer :price
      t.integer :number_of_guests
      t.integer :number_of_tents
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
