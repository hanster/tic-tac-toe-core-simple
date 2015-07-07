module TicTacToeCore
  class ComputerPlayer
    attr_reader :marker

    def initialize(marker)
      @marker = marker
    end

    def next_move(board)
      board.available_moves.sample
    end
  end
end
