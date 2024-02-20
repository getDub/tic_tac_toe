
#Project: tic tac toe

class Player
  attr_accessor :player_name, :marker_symbol, :marker_name, :player_indice

  @@number_of_players = 0

  def initialize
    @player_name = player_name
    @marker_symbol = marker_symbol
    @marker_name = marker_name
    @player_indice = player_indice #should this be in the game engine
    @@number_of_players += 1
  end
  
  def self.total_no_of_players
    @@number_of_players
  end

  def player_name
    puts "Hi player! What is your name?" 
    reply = gets.chomp
    @player_name = reply
  end

  def p_name
    @player_name
  end

  def marker_symbol
    puts "#{@player_name}, would you like to be Naughts (press O) or Crosses (press X)"
    players_choice = Kernel.gets.chomp.match(/x|X|o|O|0/)
    return @marker_symbol = players_choice.string.upcase
  end
  
  def info 
    puts "Player name = #{@player_name}, and they chose #{@marker_name}(#{@marker_symbol})"
  end

  def mark_name
    @marker_name
  end

  def marker_name
    if @marker_symbol == "X" ? @marker_name = "crosses" : @marker_name = "naughts"
    end
    puts "Thanks #{@player_name}, you're #{@marker_name}(#{@marker_symbol})'s for this game."
  end
end

#-----------------------------------------------

class Game_Engine < Player

  LINE = [[1,2,3],[4,5,6],[7,8,9]]
  
  @current_name_indice = 1
  
  attr_accessor :players, :board, :current_player
  
  def initialize
    @players = [Player.new, Player.new]
    @board = board
    @current_player = current_player
  end

  # def player_name
  #   puts "Hi player! What is your name?" 
  #   @player_name = gets.chomp
  # end

  def board
    column = " | "
    row = "--+---+--"
    LINE.each do |line|
    puts line.join(' | ')
    if line[2] != 9 
    puts row
  end
  end

  def current_player
    return @players[@current_name_indice.to_i].p_name
  end

  def next_player
    return @current_name_indice = (@current_name_indice.to_i + 1)% @players.size
  end

  def player_move
    puts "#{@current_player}, select a number on the grid to place your #{@mark_name}."
    player_grid_selection = Kernel.gets.match(/[1-9]/)
    selection = player_grid_selection.to_s
    grid_integer = selection.to_i
  end
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
# p new_game.current_player
# new_game.next_player
p new_game.current_player
p new_game.player_move
# p new_game.player_name