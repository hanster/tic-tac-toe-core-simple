module TicTacToeCore
  class Game
    attr_reader :players, :board, :user_interface

    def initialize(board, players, user_interface)
      @board = board
      @players = players
      @user_interface = user_interface
    end

    def running?
      !board.finished?
    end

    def run
      draw
      while running?
        play_turn
        draw
      end
    end

    def play_turn
      update_board(current_player.next_move(board))
    end

    def make_move(move)
      update_board(move)
    end

    def draw
      user_interface.draw(board, current_player.marker)
    end

    private

    def update_board(move)
      @board = board.move(move, current_player.marker)
    end

    FIRST = 0
    SECOND = 1

    def current_player
      if board.moves_made.even? 
        players[FIRST]
      else
        players[SECOND]
      end
    end
  end
end
