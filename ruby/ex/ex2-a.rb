class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end


RULES = {"P"=>"R", "R"=>"S", "S"=>"P"}

def strategyExists?(strategy)
  strategy == "P" || strategy == "R" || strategy == "S"
end

def secondIsBetter?(firstStrategy, secondStrategy)
  RULES[secondStrategy] == firstStrategy
end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  raise NoSuchStrategyError unless strategyExists?(game[0][1]) && strategyExists?(game[1][1])

  if secondIsBetter?(game[0][1], game[1][1])
    game[1]
  else
    game[0]
  end
end
