#Project: tic tac toe

LINE = [[1,2,3],[4,5,6],[7,8,9]]

column = " | "
$row = "--+---+--"
crosses = "X"
naughts = "0"


def players
puts "Player1, naughts or crosses?"
player1 = Kernel.gets.match(/(naughts|crosses)/) #find symbol for caps or lower case and default for non- match
puts "player1 chose #{player1}"
puts "Player 2, you will be #{}.\n LETS GO!"
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