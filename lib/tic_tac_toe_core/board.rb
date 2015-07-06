module TicTacToeCore
  class Board
    EMPTY_MARK = '-'
    attr_reader :positions

    def self.create_empty(size = 3)
      starting_positions = EMPTY_MARK * size * size
      Board.new(starting_positions.split(''))
    end

    def initialize(positions)
      @positions = positions
    end
  end
end
