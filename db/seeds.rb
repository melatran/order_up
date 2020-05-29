# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
