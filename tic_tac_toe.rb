
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
    elsif @@marker_selections[0] == "O"
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
  
  attr_accessor :players, :board, :current_player
  
  @current_name_indice = 1
  
  def initialize
    @players = [Player.new, Player.new]
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


  def current_player
    return @players[@current_name_indice.to_i].player_name
  end

  def next_player
    return @current_name_indice = (@current_name_indice.to_i + 1)% @players.size
  end

  def player_move
    puts "#{@current_player}, select a number on the grid to place your #{@marker_symbol}."
    player_grid_selection = Kernel.gets.match(/[1-9]/)
    selection = player_grid_selection.to_s
    grid_integer = selection.to_i
  end


# class Board

#   LINE.each_with_index do |array_value, array_index|
#     array_value.each_with_index do |sub_array_value, sub_array_index|
#       if sub_array_value == grid_integer
#         LINE[array_index][sub_array_index] = "X"
#       end
#     end
#   end
end

new_game = Game_Engine.new
p Player.all_players
# p new_game.current_player
# new_game.next_player
# p new_game.current_player
# p new_game.marker_name
# p new_game.player_move
# p new_game.player_name