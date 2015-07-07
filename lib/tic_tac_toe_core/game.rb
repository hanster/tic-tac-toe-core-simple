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

    def run
      draw
      while running?
        play_turn
        draw
      end
    end

    def play_turn
      @board = board.move(current_player.next_move(board), current_player.marker)
    end

    private

    FIRST = 0
    SECOND = 1

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
