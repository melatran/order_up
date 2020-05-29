require "rails_helper"

RSpec.describe "Dish's Show Page" do
  it "can display list of ingredients and chefs name and total calories" do
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

    visit "/dishes/#{sandwich.id}"

    expect(page).to have_content("Monica Geller")
    expect(page).to have_content("Turkey Sandwich With Moist Maker")
    expect(page).to have_content("Brioche")
    expect(page).to have_content("Leftover Turkey")
    expect(page).to have_content("Tomatoes")
    expect(page).to have_content("Swiss Cheese")
    expect(page).to have_content("Total Calories: 500")
  end
end

# As a visitor
# When I visit a dish's show page
# I see the total calorie count for that dish.
#
# # Story 1 of 3
# # As a visitor
# # When I visit a dish's show page
# I see a list of ingredients for that dish
# and the chef's name
