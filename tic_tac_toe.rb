
#Project: tic tac toe

LINE = [[1,2,3],[4,5,6],[7,8,9]]


$player2 = ""
$player1 = ""


class Player
  attr_accessor :player, :marker, :marker_name, :player_indice

  def initialize(plyr, m, m_name)
    @player = plyr
    @marker = m
    @marker_name = m_name
    @player_indice = player_indice
  end

  def player_info(plyr, m, m_name)
    self.player = plyr
    self.marker = m
    self.marker_name = m_name
  end
  

  def info 
    puts "Player name = #{self.player}, and they chose #{self.marker_name}(#{self.marker})"
  end
  #   def marker(x_or_o)
  #     @marker = x_or_o
  #   end
  
  #   def marker_name(x_or_o_written)
  #     @marker_name = x_or_o_written
  #   end
end

p1 = Player.new("Adam", "x", "crosses")
p p1.player
p p1.marker
p p1.marker_name
p p1.info



def player_name
  puts "Hi player! What is your name?"
end
# Get playerChoice
# puts "#{name}, would you like to be Naughts (press O) or Crosses (press X)"
# players_choice = Kernel.gets.match(/x|X|o|O|0/)
#     return @marker = players_choice.string.upcase.chomp

#MArker Name
# if @player_marker == "X" ? @marker_name = "crosses" : @marker_name = "naughts"
# end
# puts "Thanks #{name}, you're #{@marker_name}(#{@player_marker})'s for this game."
# return @marker_name

#Marker Name
# if @player_marker == "X" ? @marker_name = "crosses" : @marker_name = "naughts"
# end
# puts "Thanks #{name}, you're #{@marker_name}(#{@player_marker})'s for this game."
# return @marker_name
    
# class Game_Engine
#     attr_accessor :players
#   def initialize
#     @players = [Player.new, Player.new]
#     @current_name_indice = 1
#   end


#   def current_player
#     return @players[@current_name_indice]
#   end

#   def next_player
#     return @current_name_indice = (@current_name_indice + 1)% @players.size
#   end

# def select_position
#     puts "Player 2, select a number on the grid to place your #{$player2}."

#     player_grid_selection = Kernel.gets.match(/[1-9]/)
#     selection = player_grid_selection.to_s
#     grid_integer = selection.to_i
# end
# end

# puts new_game = Game_Engine.new
# puts new_game.player_choice

# class Board

#   LINE.each_with_index do |array_value, array_index|
#     array_value.each_with_index do |sub_array_value, sub_array_index|
#       if sub_array_value == grid_integer
#         LINE[array_index][sub_array_index] = "X"
#       end
#     end
#   end


#   def board
#     column = " | "
#     row = "--+---+--"
#     LINE.each do |line|
#     puts line.join(' | ')
#     if line[2] != 9 
#     puts row
#   end
#   end
#   end
# end