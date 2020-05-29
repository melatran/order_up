class Ingredient < ApplicationRecord
  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients

  def list_of_ingredients
    require "pry";binding.pry
  end
end
