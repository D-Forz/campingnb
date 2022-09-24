class CreateCampSupplies < ActiveRecord::Migration[7.0]
  def change
    create_table :camp_supplies do |t|
      t.references :camp, null: false, foreign_key: true
      t.references :supply, null: false, foreign_key: true

      t.timestamps
    end
  end
end
