require_relative 'ex4-a.rb'

class JellyBean < Dessert
  def initialize(name, calories, flavor)
    super(name,calories)
    @flavor = flavor
  end

  attr_accessor :flavor

  def delicious?
    @flavor != "black licorice"
  end
end
