class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :category_id
      t.integer :condition_id
      t.integer :shipping_fee_id
      t.integer :shipping_area_id
      t.integer :shipping_day_id
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
