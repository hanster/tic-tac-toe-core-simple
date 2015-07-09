require 'tic_tac_toe_core/negamax_ai'

module TicTacToeCore
  class ComputerPlayer
    MOVE_MATTERS_UPPER_COUNT = 11

    attr_reader :marker

    def initialize(marker)
      @marker = marker
      @ai = NegamaxAi.new
    end

    def next_move(board)
      if move_matters(board)
        ai.next_move(board, marker)
      else
        board.available_moves.sample
      end
    end

    private

    def move_matters(board)
      board.available_moves.count <= MOVE_MATTERS_UPPER_COUNT
    end

    attr_reader :ai
  end
end
