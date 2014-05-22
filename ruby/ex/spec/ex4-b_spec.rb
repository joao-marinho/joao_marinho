require File.join(File.dirname(__FILE__), "../ex4-b.rb")

describe JellyBean do
  before(:each) do
    @jellyBean = JellyBean.new("Doidera", 12, "Loucura")
  end

  context "when have 200 or more calories" do
    before(:each) do
      @jellyBean.calories = 1000
    end
    it "isn't healthy" do
      @jellyBean.healthy?.should_not be_true
    end
  end
  context "when less then 200 calories" do
    before(:each) do
      @jellyBean.calories = 10
    end
    it "is healthy" do
      @jellyBean.healthy?.should be_true
    end
  end
  context "when the flavor is black licorice" do
    before(:each) do
      @jellyBean.flavor = "black licorice"
    end
    it "isn't delicious" do
      @jellyBean.delicious?.should_not be_true
    end
  end

  context "when the flavor isn't black licorice" do
    before(:each) do
      @jellyBean.flavor = "pimenta"
    end
    it "is delicious" do
      @jellyBean.delicious?.should be_true
    end
  end
end
