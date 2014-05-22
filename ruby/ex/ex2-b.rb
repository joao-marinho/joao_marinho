require File.join(File.dirname(__FILE__), "./ex2-a.rb")

def is_tournament?(game)
  return game[0][0].is_a? Array
end

def rps_tournament_winner(game)
  if is_tournament? game
    firstWinner = rps_tournament_winner(game[0])
    secondWinner = rps_tournament_winner(game[1])
    game = [firstWinner, secondWinner]
  end

  rps_game_winner(game)
end
