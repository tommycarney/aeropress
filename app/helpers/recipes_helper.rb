module RecipesHelper
  def beverage_names
    Recipe.beverage_names
  end

  def technique_names
    Recipe.technique_names
  end
end
