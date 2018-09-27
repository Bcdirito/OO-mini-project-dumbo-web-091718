class Ingredient
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    common_allergen = Allergen.all.group_by do |allergen|
      allergen.ingredient.name
    end
    sorted_allergen = common_allergen.sort_by do |key, value|
      -value.count
    end
    binding.pry
    sorted_allergen[0][0]
  end
end
