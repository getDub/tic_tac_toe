
#Project: tic tac toe

LINE = [[1,2,3],[4,5,6],[7,8,9]]



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
    # puts "Player 1 chose #{player1}'s"
    puts "Player 1 chose crosses"
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