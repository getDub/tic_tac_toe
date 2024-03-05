# Project: tic tac toe

class Player
  attr_reader :ask_for_name, :player_name, :marker_symbol, :mark_name, :player_indice

  @@marker_selections = []

  def initialize
    @ask_for_name = ask_for_name
    @ask_for_marker_choice = ask_for_marker_choice
    @player_name = player_name
    @marker_symbol = marker_symbol
    @marker_name = marker_name
    @@marker_selections << @marker_symbol
  end

  def self.marker_selections
    @@marker_selections
  end

  def ask_for_name
    if @@marker_selections == []
      puts 'Hi player. Enter your name.'
    else
      puts 'Next player, please enter your name'
    end
    @player_name = gets.chomp
  end

  def ask_for_marker_choice
    if @@marker_selections[0] == 'X'
      @marker_symbol = 'O'
    elsif @@marker_selections[0] == 'O'
      @@marker_symbol = 'X'
    else
      puts "#{@player_name}, would you like to be naughts (press o) or crosses (press x)?"
      valid_character?(gets.chomp.to_s.upcase)
    end
  end

  def valid_character?(selection)
    if /\b[oOxX]\b/.match(selection) == nil
      puts 'Not a valid character. Try again.'
      ask_for_marker_choice
    else @marker_symbol = selection
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
    return unless @marker_symbol == 'X' ? (@marker_name = 'crosses') : (@marker_name = 'naughts')

    puts "Thanks #{@player_name}, you're #{@marker_name}(#{@marker_symbol})'s for this game."
  end

end

class GameEngine
  GRID_NUMBERS = [[1, 2, 3], [4, 5, 6], [7, 8, 9]].freeze
  WIN_COMBOS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]].freeze
  attr_reader :players, :board, :current_player

  @current_name_indice = 1

  def initialize
    @players = [Player.new, Player.new]
    puts 'Choose a number from 1 - 9 to place your marker on the corresponding number in the board below.'
    @print_board = print_board
    @current_player = current_player
  end

  def print_board
    row = '--+---+--'
    GRID_NUMBERS.each do |line|
      puts line.join(' | ')
      puts row if line[2] != 9
    end
  end

  def play_game
    @start = true
    while @start == true

      next_player
      puts "#{current_player} it's your move."
      grid_number_selection = gets.match(/\b[1-9]\b/).to_s.to_i
      place_marker_on_board(grid_number_selection)
      print_board
      tie?
      won?
    end
  end

  def place_marker_on_board(player_input)
    position_already_taken?(player_input)
    replace_grid_num_with_marker(GRID_NUMBERS, player_input)
    replace_grid_num_with_marker(WIN_COMBOS, player_input)
  end

  def current_player
    @players[@current_name_indice.to_i].player_name
  end

  def next_player
    @current_name_indice = (@current_name_indice.to_i + 1) % @players.size
  end

  def current_marker
    Player.marker_selections[@current_name_indice.to_i]
  end

  def replace_grid_num_with_marker(const_array, grid_num)
    const_array.each_with_index do |array_value, array_index|
      array_value.each_with_index do |sub_array_value, sub_array_index|
        const_array[array_index][sub_array_index] = current_marker if sub_array_value == grid_num
      end
    end
  end
  
  def won?
    WIN_COMBOS.each do |combinations|
      if combinations.all?('X') || combinations.all?('O')
        puts "#{current_player.upcase} YOU WIN!"
        @start = false
      end
    end
  end

  def position_already_taken?(grid_num)
    return unless GRID_NUMBERS.flatten.none?(grid_num)

    puts "#{current_player} this move is not valid. Select another position"
    next_player
  end

  def tie?
    return unless GRID_NUMBERS.flatten.none?(1..9)

    puts "It's a draw"
    @start = false
  end


end

GameEngine.new.play_game