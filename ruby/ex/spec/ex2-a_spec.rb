require File.join(File.dirname(__FILE__), "../ex2-a.rb");

describe "strategyExists?" do
  it "return true for P" do
    strategyExists?("P").should be_true
  end

  it "return true for R" do
    strategyExists?("R").should be_true
  end

  it "return true for S" do
    strategyExists?("S").should be_true
  end

  it "return false for X" do
    strategyExists?("X").should_not be_true
  end
end
