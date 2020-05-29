class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def list_of_ingredients
    dishes.joins(:ingredients).distinct.pluck("ingredients.name")
  end

  def most_popular #desc order
    Ingredient.joins(:dishes).group(:id).order("count(dishes.id) desc").limit(3).pluck(:name)
  end
end

# joins(:item_orders).select("items.*, sum(item_orders.quantity) as total_quantity").group(:id).order("total_quantity #{direction}").limit(5)
