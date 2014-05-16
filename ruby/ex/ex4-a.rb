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

a = Dessert.new("Loucura", 100)
p a.healthy?, a.delicious?
a.calories = 1000
p a.healthy?, a.delicious?
