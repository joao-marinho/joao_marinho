require File.join(File.dirname(__FILE__), "../ex4-a.rb")

describe Dessert do
  before(:each) do
    @dessert = Dessert.new("Feijao", 1000)
  end
  it "return true for delicious" do
    @dessert.delicious?.should be_true
  end
  context "when have 200 or more calories" do
    before(:each) do
      @dessert.calories = 1000
    end
    it "isn't healthy" do
      @dessert.healthy?.should_not be_true
    end
  end
  context "when less then 200 calories" do
    before(:each) do
      @dessert.calories = 10
    end
    it "is healthy" do
      @dessert.healthy?.should be_true
    end
  end

end
