class Recipe
  attr_reader :user, :name, :ingredients

  @@all = []

  def initialize(user, name)
    @user = user
    @name = name
    @@all << self
    @ingredients = []
  end

  def add_ingredients(ingredients_array)
    ingredients_array.each do |ingredient|
      @ingredients << ingredient.name
    end
  end

  def allergens
    allergens = []
    Allergen.all.each do |allergen|
      if self.ingredients.include?(allergen.ingredient.name)
        allergens << allergen
      end
    end
    allergens
  end

  def self.all
    @@all
  end

  def self.most_popular
    popular_recipe = RecipeCard.all.group_by do |recipe|
      recipe.recipe.name
    end
    most_popular = popular_recipe.sort_by do |key, value|
      -value.count
    end
    most_popular[0][0]
  end
end
