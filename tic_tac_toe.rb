
#Project: tic tac toe

class Player
  attr_accessor :ask_for_name, :player_name, :marker_symbol, :marker_name, :player_indice

  @@all_players = []
  @@marker_selections = []

  def initialize
    @ask_for_name = ask_for_name
    @ask_for_marker_choice = ask_for_marker_choice
    @player_name = player_name
    @marker_symbol = marker_symbol
    @marker_name = marker_name
    @player_indice = player_indice
    @@all_players << self
    @@marker_selections << @marker_symbol
  end
  
  def self.all_players
    @@all_players
  end

  def self.marker_selections
    @@marker_selctions
  end

  def ask_for_name
    if @@all_players == []
      puts "Hi player. Enter your name." 
      @player_name = gets.chomp
    else
      puts "Next player, please enter your name"
      @player_name = gets.chomp
    end
  end

  def ask_for_marker_choice
    if @@marker_selections[0] == "X"
      return @marker_symbol = "O"
    elsif @@marker_selections[0] == "O" || @@marker_selections[0] == "0"
      return @marker_symbol = "X"
    else
    puts "#{@player_name}, would you like to be naughts (press o) or crosses (press x)?"
    players_choice = Kernel.gets.chomp.match(/x|X|o|O|0/)
    return @marker_symbol = players_choice.string.upcase
    end
  end


  def player_name
    @player_name
  end

  def marker_symbol
    @marker_symbol
  end

  def mark_name
    @marker_name
  end

  def symbol
    @marker_symbol
  end

  def marker_name
    if @marker_symbol == "X" ? @marker_name = "crosses" : @marker_name = "naughts"
      puts "Thanks #{@player_name}, you're #{@marker_name}(#{@marker_symbol})'s for this game."
      return @marker_name
    end
  end

end

#-----------------------------------------------

class Game_Engine 

  LINE = [[1,2,3],[4,5,6],[7,8,9]]
  WIN_COMBOS = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  CROSS = ["X","X","X"]
  NAUGHTS = ["O","O","O"]
  
  attr_accessor :players, :board, :current_player
  
  @current_name_indice = 1
  
  def initialize
    @players = [Player.new, Player.new]
    puts "Choose a number from 1 - 9 to place your marker on the corresponding number on the board below."
    @board = board
    @current_player = current_player
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

  def play_game
    2.times do
    puts "#{current_player} it's your move."
    grid_number = gets.match(/[1-9]/).to_s.to_i
    put_marker_on_board(grid_number)
    board
    puts "#{current_player} chose #{grid_number}"
    p current_marker
    next_player
    end
  end

  def current_player
    return @players[@current_name_indice.to_i].player_name
  end

  def next_player
    return @current_name_indice = (@current_name_indice.to_i + 1)% @players.size
  end

  def current_marker 
    Player.marker_selections[@current_name_indice.to_i]
  end
  
  def player_grid_selection
    num = Kernel.gets.match(/[1-9]/)
    return grid_selection = num.to_s.to_i
  end
  
  def put_marker_on_board(grid_num)
    LINE.each_with_index do |array_value, array_index|
      array_value.each_with_index do |sub_array_value, sub_array_index|
        if sub_array_value == grid_num
          LINE[array_index][sub_array_index] = current_marker
        end
      end
    end
  end
end

new_game = Game_Engine.new.play_game
p Player.all_players
# p new_game.current_player
# new_game.next_player
# p new_game.current_player
# p new_game.marker_name
# p new_game.player_move
# p new_game.player_name





# def player_move
# puts "#{@current_player}, select a number on the grid to place your #{@marker_symbol}."
# player_grid_selection = Kernel.gets.match(/[1-9]/)
# selection = player_grid_selection.to_s
# grid_integer = selection.to_i
# end


# class Board
#   LINE.each_with_index do |array_value, array_index|
#     array_value.each_with_index do |sub_array_value, sub_array_index|
#       if sub_array_value == grid_integer
#         LINE[array_index][sub_array_index] = "X"
#       end
#     end
#   end