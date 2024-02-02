#Project: tic tac toe

LINE = [[1,2,3],[4,5,6],[7,8,9]]

column = " | "
$row = "--+---+--"


def players
  crosses = "X"
  naughts = "0"
  puts "Player1, naughts or crosses?"
  player1 = Kernel.gets.chomp #find symbol for caps or lower case and default for non- match
if player1 == "crosses"
  player1 = crosses
  player2 = naughts
else
    player1 = naughts
    player2 = crosses
end
puts "Player 1 chose #{player1}'s"
puts "Player 2, you will be #{player2}'s.\n LETS GO!"
end
players

# LINE[0][0] = crosses
# LINE[1][1] = naughts



def board
LINE.each do |line|
  puts line.join(' | ')
  puts $row 
end
end

board