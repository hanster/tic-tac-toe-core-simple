require 'tic_tac_toe_core/human_player'
require 'tic_tac_toe_core/computer_player'
require 'tic_tac_toe_core/board'
require 'tic_tac_toe_core/game'

module TicTacToeCore
  class GameSetup
    HVH_GAME_TYPE = 1
    CVH_GAME_TYPE = 2
    HVC_GAME_TYPE = 3
    CVC_GAME_TYPE = 4
    PLAYER_OPTIONS = {
      HVH_GAME_TYPE => 'Human vs Human',
      CVH_GAME_TYPE  => 'Computer vs Human',
      HVC_GAME_TYPE  => 'Human vs Computer',
      CVC_GAME_TYPE  => 'Computer vs Computer'
    }
    BOARD_OPTIONS = {
      3 => '3x3',
      4 => '4x4'
    }
    X_MARKER = 'X'
    O_MARKER = 'O'

    def initialize(user_interface)
      @user_interface = user_interface
    end

    def build_game
      board_type = user_interface.get_board_type
      players_type = user_interface.get_players_type
      board = Board.create_empty(board_type)
      players = create_players(players_type)

      Game.new(board, players, user_interface)
    end

    def self.get_player_options
      PLAYER_OPTIONS.values
    end

    def self.get_board_options
      BOARD_OPTIONS.values
    end

    private

    def create_players(players_type)
      case players_type
      when HVH_GAME_TYPE
        [human(X_MARKER), human(O_MARKER)]
      when CVH_GAME_TYPE
        [computer(X_MARKER), human(O_MARKER)]
      when HVC_GAME_TYPE
        [human(X_MARKER), computer(O_MARKER)]
      when CVC_GAME_TYPE
        [computer(X_MARKER), computer(O_MARKER)]
      else
        [human(X_MARKER), human(O_MARKER)]
      end
    end

    def human(marker)
      HumanPlayer.new(marker, user_interface)
    end

    def computer(marker)
      ComputerPlayer.new(marker)
    end

    attr_reader :user_interface
  end
end
