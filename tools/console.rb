require_relative '../config/environment.rb'
brian = User.new("brian")
christine = User.new("christine")
prince = User.new("prince")

ingredient1 = Ingredient.new("spinach")
ingredient2 = Ingredient.new("chicken")
ingredient3 = Ingredient.new("lettuce")
ingredient4 = Ingredient.new("chocolate")

recipe1 = Recipe.new(brian, "tasty")
recipe2 = Recipe.new(christine, "tasty")
recipe3 = Recipe.new(christine, "delish")
recipe4 = Recipe.new(christine, "yikes")
recipe5 = Recipe.new(christine, "yum")
recipe6 = Recipe.new(brian, "yum")

recipecard1 = RecipeCard.new(recipe1, brian, 20180202, 5)
recipecard2 = RecipeCard.new(recipe1, brian, 20180202, 6)
recipecard3 = RecipeCard.new(recipe3, christine, 20180102, 5)
recipecard4 = RecipeCard.new(recipe4, christine, 20180927, 1)
recipecard5 = RecipeCard.new(recipe5, christine, 20171022, 10)
recipecard6 = RecipeCard.new(recipe2, christine, 20121022, 7)
recipecard7 = RecipeCard.new(recipe6, brian, 20180927, 10)

recipeingredient1 = RecipeIngredient.new(ingredient1, recipe1)
recipeingredient2 = RecipeIngredient.new(ingredient2, recipe2)
recipeingredient3 = RecipeIngredient.new(ingredient3, recipe3)

allergen1 = Allergen.new(brian, ingredient1)
allergen2 = Allergen.new(christine, ingredient2)
allergen3 = Allergen.new(christine, ingredient3)
allergen4 = Allergen.new(brian, ingredient3)
allergen5 = Allergen.new(prince, ingredient3)

recipe1.add_ingredients([ingredient1, ingredient2])
recipe2.add_ingredients([ingredient2, ingredient3])
recipe3.add_ingredients([ingredient3, ingredient1])
recipe4.add_ingredients([ingredient1, ingredient2])
recipe5.add_ingredients([ingredient1, ingredient3])
recipe6.add_ingredients([ingredient2, ingredient4])
binding.pry
