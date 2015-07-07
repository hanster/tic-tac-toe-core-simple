module TicTacToeCore
  class Game
    def initialize(board, players, ui)
      @board = board
      @players = players
      @ui = ui
    end

    def running?
      !board.finished?
    end

    def play_turn
      draw
      while running?
        make_player_move
        draw
      end
    end

    private

    FIRST = 0
    SECOND = 1

    def make_player_move
      @board = board.move(current_player.next_move(board), current_player.marker)
    end

    def draw
      ui.draw(board)
    end

    def current_player
      if board.moves_made.even? 
        players[FIRST]
      else
        players[SECOND]
      end
    end

    attr_reader :players, :board, :ui
  end
end
