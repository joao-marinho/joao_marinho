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

  game[1] if secondIsBetter?(game[0][1], game[1][1])

  game[0]
end

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

a = 
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

p rps_tournament_winner(a)