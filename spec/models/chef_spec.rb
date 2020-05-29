require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "methods" do
    it ".list_of_ingredients" do
      monica = Chef.create(name: "Monica Geller")
      sandwich = Dish.create(name: "Turkey Sandwich With Moist Maker", description: "It's my sandwich!", chef_id: monica.id)


      bread = Ingredient.create(name: "Brioche", calories: 200)
      turkey = Ingredient.create(name: "Leftover Turkey", calories: 150)
      tomatoes = Ingredient.create(name: "Tomatoes", calories: 60)
      cheese = Ingredient.create(name: "Swiss Cheese", calories: 90)
      cheese = Ingredient.create(name: "Swiss Cheese", calories: 90)


      DishIngredient.create(dish_id: sandwich.id, ingredient_id: bread.id)
      DishIngredient.create(dish_id: sandwich.id, ingredient_id: turkey.id)
      DishIngredient.create(dish_id: sandwich.id, ingredient_id: tomatoes.id)
      DishIngredient.create(dish_id: sandwich.id, ingredient_id: cheese.id)

      expect(monica.list_of_ingredients).to eq(["Brioche", "Leftover Turkey", "Swiss Cheese", "Tomatoes"])
    end

    it ".most_popuar" do
      monica = Chef.create(name: "Monica Geller")
      sandwich = Dish.create(name: "Turkey Sandwich With Moist Maker", description: "It's my sandwich!", chef_id: monica.id)
      fondue = Dish.create(name: "Cheese Fondue", description: "It's delicious", chef_id: monica.id)

      bread = Ingredient.create(name: "Brioche", calories: 200)
      turkey = Ingredient.create(name: "Leftover Turkey", calories: 150)
      tomatoes = Ingredient.create(name: "Tomatoes", calories: 60)
      cheese = Ingredient.create(name: "Swiss Cheese", calories: 90)
      sugar = Ingredient.create(name: "Sugar", calories: 100)

      DishIngredient.create(dish_id: sandwich.id, ingredient_id: bread.id)
      DishIngredient.create(dish_id: sandwich.id, ingredient_id: turkey.id)
      DishIngredient.create(dish_id: sandwich.id, ingredient_id: tomatoes.id)
      DishIngredient.create(dish_id: sandwich.id, ingredient_id: cheese.id)
      DishIngredient.create(dish_id: fondue.id, ingredient_id: cheese.id)
      DishIngredient.create(dish_id: fondue.id, ingredient_id: sugar.id)

      eggs = Dish.create(name: "Breakfast Sandwich", description: "EggTastic", chef_id: monica.id)
      bagel = Dish.create(name: "Bagel", description: "EggTastic", chef_id: monica.id)
      sprinkles = Dish.create(name: "Sugar Sprinkles", description: "Sprinkles", chef_id: monica.id)
      egg = Ingredient.create(name: "Egg", calories: 80)

      DishIngredient.create(dish_id: eggs.id, ingredient_id: egg.id)
      DishIngredient.create(dish_id: eggs.id, ingredient_id: bread.id)
      DishIngredient.create(dish_id: eggs.id, ingredient_id: sugar.id)
      DishIngredient.create(dish_id: bagel.id, ingredient_id: bread.id)
      DishIngredient.create(dish_id: sprinkles.id, ingredient_id: sugar.id)
      DishIngredient.create(dish_id: eggs.id, ingredient_id: cheese.id)
      
      expect(monica.most_popular).to eq(["Brioche", "Sugar", "Swiss Cheese"])
    end
  end
end
