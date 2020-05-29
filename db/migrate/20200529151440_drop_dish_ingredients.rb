class DropDishIngredients < ActiveRecord::Migration[5.1]
  def change
    drop_table :dish_ingredients
  end
end
