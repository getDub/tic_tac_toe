
#Project: tic tac toe

LINE = [[1,2,3],[4,5,6],[7,8,9]]



def players
    player1 = ""
    player2 = ""
    puts "Player1, would you like to be Naughts (press O) or Crosses (press X)"
    player1_choice = Kernel.gets.match(/x|X|o|O|0/)
    player1 = player1_choice.string.upcase.chomp
    if player1 == "X"? player2 = "O" : player2 = "X"
    end
    puts "Player 1 chose #{player1}'s"
    puts "Player 2, you will be #{player2}'s.\n LETS GO!"
end
players

puts "Player 1, your move."

player1_move = Kernel.gets.chomp

LINE.each_with_index do |array_value, array_index|
    array_value.each_with_index do |sub_array_value, sub_array_index|
        if sub_array_value == 5
            LINE[array_index][sub_array_index] = "X"

        end
    end
end


def board
    column = " | "
    row = "--+---+--"
    LINE.each do |line|
    puts line.join(' | ')
    if line[2] != 9 
    puts row
end
end
end

board