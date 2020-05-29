require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "methods" do
    it ".total_calories" do
      monica = Chef.create(name: "Monica Geller")
      sandwich = Dish.create(name: "Turkey Sandwich With Moist Maker", description: "It's my sandwich!", chef_id: monica.id)

      bread = Ingredient.create(name: "Brioche", calories: 200)
      turkey = Ingredient.create(name: "Leftover Turkey", calories: 150)
      tomatoes = Ingredient.create(name: "Tomatoes", calories: 60)
      cheese = Ingredient.create(name: "Swiss Cheese", calories: 90)

      DishIngredient.create(dish_id: sandwich.id, ingredient_id: bread.id)
      DishIngredient.create(dish_id: sandwich.id, ingredient_id: turkey.id)
      DishIngredient.create(dish_id: sandwich.id, ingredient_id: tomatoes.id)
      DishIngredient.create(dish_id: sandwich.id, ingredient_id: cheese.id)
      
      expect(sandwich.total_calories).to eq(500)
    end
  end
end
