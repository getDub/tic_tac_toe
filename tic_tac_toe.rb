#Project: tic tac toe

class Player
  attr_accessor :ask_for_name, :player_name, :marker_symbol, :marker_name, :player_indice

  @@marker_selections = []

  def initialize
    @ask_for_name = ask_for_name
    @ask_for_marker_choice = ask_for_marker_choice
    @player_name = player_name
    @marker_symbol = marker_symbol
    @marker_name = marker_name
    @player_indice = player_indice
    @@marker_selections << @marker_symbol
  end

  def self.marker_selections
    @@marker_selections
  end

  def ask_for_name
    if @@marker_selections == []
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
    is_valid_character?(players_choice = gets.chomp.to_s.upcase)
    end
  end

  def is_valid_character?(selection)
    if /\b[oOxX]\b/.match(selection) == nil
      puts "Not a valid character. Try again."
      ask_for_marker_choice
    else 
      return @marker_symbol = selection
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
  
  attr_accessor :players, :board, :current_player
  
  @current_name_indice = 1
  
  def initialize
    @players = [Player.new, Player.new]
    puts "Choose a number from 1 - 9 to place your marker on the corresponding number in the board below."
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
    @start = true

    while @start == true do
      
      next_player
      puts "#{current_player} it's your move."
      grid_number_selection = gets.match(/[1-9]/).to_s.to_i
      player_move(grid_number_selection)

      is_draw?
      has_won?
        
      board   
    end
  end
  
  def player_move(player_input) 
    position_already_taken?(player_input)
    replace_grid_num_with_marker(LINE, player_input)
    replace_grid_num_with_marker(WIN_COMBOS, player_input)
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

  def replace_grid_num_with_marker(const_array, grid_num)
    const_array.each_with_index do |array_value, array_index|
      array_value.each_with_index do |sub_array_value, sub_array_index|
        if sub_array_value == grid_num
          const_array[array_index][sub_array_index] = current_marker
        end
      end
    end
  end
  
  def has_won?
    WIN_COMBOS.each do |combinations|
      if combinations.all?('X') || combinations.all?('O')
        puts "#{current_player} YOU WIN!"
        @start = false
      end
    end
  end  

  def position_already_taken?(grid_num)
    if LINE.flatten.none?(grid_num)
    puts "Sorry #{current_player} this place is already taken. Select another position"
    next_player
    end
  end

  def is_draw?
    if LINE.flatten.none?(1..9)
        puts "its a draw"
        @start = false
      end
  end


end

new_game = Game_Engine.new.play_game
