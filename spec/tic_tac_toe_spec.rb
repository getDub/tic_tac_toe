require './lib/tic_tac_toe'

describe Game_Engine do 
  before do
    allow_any_instance_of(Player).to receive(:ask_for_name).and_return("Angela")
    allow_any_instance_of(Player).to receive(:ask_for_marker_choice).and_return("X")
    allow_any_instance_of(Player).to receive(:marker_name).and_return("crosses")
    allow_any_instance_of(Player).to receive(:ask_for_name).and_return("Clint")

    Player.class_variable_set(:@@marker_selections, ["X", "O"])
    
    allow($stdout).to receive(:write)
  end
  
  # subject(:game) { described_class.new }
  describe '#has_won?' do
  
  before do
    stub_const("Game_Engine::WIN_COMBOS", [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]] )
  end
  context 'horizontal row filled with markger' do
    it 'detects a row of crosses on the top row' do
      Game_Engine::WIN_COMBOS[0] = ["X", "X", "X"]
      
      game = Game_Engine.new
      allow(game).to receive(:current_player).and_return("Angela")
      
      expect { game.has_won? }.to output("Angela YOU WIN!\n").to_stdout
    end
    it 'detects a row of crosses across the middle row' do
      
      game = Game_Engine.new
      allow(game).to receive(:current_player).and_return("Angela")
      Game_Engine::WIN_COMBOS[1] = ["X", "X", "X"]
      
      expect { game.has_won? }.to output("Angela YOU WIN!\n").to_stdout
      end
    it 'detects a row of crosses on the bottom row' do
      
      game = Game_Engine.new
      allow(game).to receive(:current_player).and_return("Angela")
      Game_Engine::WIN_COMBOS[2] = ["X", "X", "X"]

      expect { game.has_won? }.to output("Angela YOU WIN!\n").to_stdout
      end
    it 'detects a row of croses running diagonally' do
      
      game = Game_Engine.new
      allow(game).to receive(:current_player).and_return("Angela")
      Game_Engine::WIN_COMBOS[3] = %w(X X X)

      expect { game.has_won? }.to output("Angela YOU WIN!\n").to_stdout
    end
    it 'detects a row of croses running diagonally' do
      
      game = Game_Engine.new
      allow(game).to receive(:current_player).and_return("Angela")
      Game_Engine::WIN_COMBOS[7] = %w(X X X)

      expect { game.has_won? }.to output("Angela YOU WIN!\n").to_stdout
      end
    end
  end
end
