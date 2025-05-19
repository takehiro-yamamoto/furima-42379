class AddNotNullConstraintsToItems < ActiveRecord::Migration[7.1]
  def change
    change_column_null :items, :name, false
    change_column_null :items, :description, false
    change_column_null :items, :category_id, false
    change_column_null :items, :condition_id, false
    change_column_null :items, :shipping_fee_id, false
    change_column_null :items, :shipping_area_id, false
    change_column_null :items, :shipping_day_id, false
    change_column_null :items, :price, false
    change_column_null :items, :user_id, false
  end
end
