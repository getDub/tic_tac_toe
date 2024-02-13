
#Project: tic tac toe



class Player
  attr_accessor :player, :marker, :marker_name, :player_indice

  @@number_of_players = 0

  def initialize
    @player = player_name
    @marker = marker
    @marker_name = marker_name
    @player_indice = player_indice #should this be in the game engine
    @@number_of_players += 1
  end

  def self.total_no_of_players
    @@number_of_players
  end
    
  def player_name
    puts "Hi player! What is your name?"
    @player = gets.chomp
  end

  def marker
    puts "#{player}, would you like to be Naughts (press O) or Crosses (press X)"
    players_choice = Kernel.gets.match(/x|X|o|O|0/)
    return @marker = players_choice.string.upcase.chomp
  end
  
  def info 
    puts "Player name = #{self.player}, and they chose #{self.marker_name}(#{self.marker})"
  end

  private

  def marker_name
    if @marker == "X" ? @marker_name = "crosses" : @marker_name = "naughts"
    end
    puts "Thanks #{@player}, you're #{@marker_name}(#{@marker})'s for this game."
  end
end

# p1 = Player.new



    
class Game_Engine

  LINE = [[1,2,3],[4,5,6],[7,8,9]]

  @current_name_indice = 1
  # @player = current_player
  
  attr_accessor :players, :board

  def initialize
    @players = [Player.new, Player.new]
    @board = board
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

  def current_player
    return @players[@current_name_indice]
  end

  def next_player
    return @current_name_indice = (@current_name_indice + 1)% @players.size
  end

  def player_move
    puts "#{current_player}, select a number on the grid to place your #{@current_player}."
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