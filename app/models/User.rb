class User
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    RecipeCard.all.select do |recipe|
      recipe.user.name == self.name
    end.map do |recipecard|
      recipecard.recipe
    end
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(recipe, self, date, rating)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    Allergen.all.select do |allergen|
      allergen.user.name == self.name
    end
  end

  def top_three_recipes
    sorted_recipes = self.recipes.sort_by do |recipe|
      -recipe.rating
    end
    top_three_recipes = sorted_recipes[0..2]
    top_three_recipes.map do |recipe|
      recipe.recipe.name
    end
  end

  def most_recent_recipe
    sorted_recipes = self.recipes.sort_by do |recipe|
      -recipe.date
    end.first.recipe
  end

  def safe_recipes
    safe_recipes = []

    allergens = self.allergens.map do |allergen|
      allergen.ingredient.name
    end

    self.recipes.each do |recipe|
      recipe.ingredients.each do |ingredient|
        if allergens.include?(ingredient) == true
          break
        else
          safe_recipes << recipe
        end
      end
    end
    safe_recipes.uniq!
  end
end
