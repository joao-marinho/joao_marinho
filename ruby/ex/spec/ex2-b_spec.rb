require File.join(File.dirname(__FILE__), "../ex2-b.rb")

describe "is_tournament?" do
  it "return true for a game that is a tournament" do
    game = [ [ ["Armando", "P"], ["Dave", "S"] ], [ ["Richard", "R"], ["Michael", "S"] ] ]
    is_tournament?(game).should be_true
  end

  it "return false for a game that isn't a tournament" do
    game =[ ["Armando", "P"], ["Dave", "S"] ]
    is_tournament?(game).should_not be_true
  end
end

describe "rps_tournament_winner" do
  before(:all) do
    @winnerName = ["Richard", "R"]
    @simple_game = [["Richard", "R"], ["Michael", "S"]]
    @tournament =
    [
    [
    [ ["Armando", "P"], ["Dave", "S"] ],
    [ ["Richard", "R"], ["Michael", "S"] ],
    ],
    [
    [ ["Allen", "S"], ["Omer", "P"] ],
    [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
    ]
  end

  it "return the winner of a simple game" do
    rps_tournament_winner(@tournament).should eq(@winnerName)
  end

  it "return the winner of a tournament" do
    rps_tournament_winner(@tournament).should eq(@winnerName)
  end
end
