class Dessert
  def initialize(name, calories)
    @name = name
    @calories = calories
  end

  attr_accessor :name
  attr_accessor :calories

  def healthy?
    @calories < 200
  end
  def delicious?
    true
  end
end

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

a = JellyBean.new("Loucura", 100, "black")
p a.healthy?, a.delicious?
a.calories = 1000
a.flavor = "black licorice"
p a.healthy?, a.delicious?
