require "rails_helper"

RSpec.describe "Chef's Show Page" do
  before :each do
    @monica = Chef.create(name: "Monica Geller")
    @sandwich = Dish.create(name: "Turkey Sandwich With Moist Maker", description: "It's my sandwich!", chef_id: @monica.id)
    @fondue = Dish.create(name: "Cheese Fondue", description: "It's delicious", chef_id: @monica.id)

    @bread = Ingredient.create(name: "Brioche", calories: 200)
    @turkey = Ingredient.create(name: "Leftover Turkey", calories: 150)
    @tomatoes = Ingredient.create(name: "Tomatoes", calories: 60)
    @cheese = Ingredient.create(name: "Swiss Cheese", calories: 90)
    @sugar = Ingredient.create(name: "Sugar", calories: 100)

    DishIngredient.create(dish_id: @sandwich.id, ingredient_id: @bread.id)
    DishIngredient.create(dish_id: @sandwich.id, ingredient_id: @turkey.id)
    DishIngredient.create(dish_id: @sandwich.id, ingredient_id: @tomatoes.id)
    DishIngredient.create(dish_id: @sandwich.id, ingredient_id: @cheese.id)
    DishIngredient.create(dish_id: @fondue.id, ingredient_id: @cheese.id)
    DishIngredient.create(dish_id: @fondue.id, ingredient_id: @sugar.id)
  end

  it "can show chef's name and link to chef's ingredients" do
    visit "/chefs/#{@monica.id}"

    expect(page).to have_content("Monica Geller")
    expect(page).to have_link("See All Ingredients")
  end

  it "can click on ingredinets link to see all ingredients chef uses" do
    visit "/chefs/#{@monica.id}"
    click_link "See All Ingredients"
    expect(current_path).to eq("/chefs/#{@monica.id}/ingredients")

    expect(page).to have_content("Brioche")
    expect(page).to have_content("Leftover Turkey")
    expect(page).to have_content("Tomatoes")
    expect(page).to have_content("Swiss Cheese")
    expect(page).to have_content("Sugar")
  end
end

# As a visitor
# When I visit a chef's show page
# I see the name of that chef
# And I see a link to view a list of all ingredients that this chef uses in their dishes
# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses
