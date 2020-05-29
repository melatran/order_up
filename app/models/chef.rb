class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def list_of_ingredients
    dishes.joins(:ingredients).distinct.pluck("ingredients.name")
  end

end
