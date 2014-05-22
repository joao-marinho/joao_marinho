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

describe "secondIsBetter?" do
  it "return true for R vs P" do
    secondIsBetter?("R", "P").should be_true
  end

  it "return true for P vs S" do
    secondIsBetter?("P", "S").should be_true
  end

  it "return true for S vs R" do
    secondIsBetter?("S", "R").should be_true
  end

  it "return false when the strategies are equal" do
    secondIsBetter?("S", "S").should_not be_true
  end

  it "return false when the first strategy is better" do
    secondIsBetter?("S", "P").should_not be_true
  end
end

describe "rps_game_winner" do

    it "raise WrongNumberOfPlayersError when the number of players are different of 2" do
      game = [["P"],["L"],["Y"]];
      expect { rps_game_winner(game) }.to raise_error(WrongNumberOfPlayersError);
    end

    it "raise NoSuchStrategyError when the strategy does not exist" do
      game = [["Armando", "P"],["Antonio", "X"]];
      expect { rps_game_winner(game) }.to raise_error(NoSuchStrategyError);
    end

    it "return the winner" do
      winner = ["Joao", "S"]
      loser = ["Batista", "P"]
      game = [winner, loser];

      rps_game_winner(game).should be(winner);
    end

  end
