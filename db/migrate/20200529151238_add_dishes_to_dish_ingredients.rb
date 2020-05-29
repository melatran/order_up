class AddDishesToDishIngredients < ActiveRecord::Migration[5.1]
  def change
    add_reference :dish_ingredients, :dishes, foreign_key: true
  end
end
