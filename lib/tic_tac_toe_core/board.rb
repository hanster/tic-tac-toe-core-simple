module TicTacToeCore
  class Board
    EMPTY_MARK = '-'
    WINNING_ROWS = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]]

    attr_reader :positions

    def self.create_empty(size = 3)
      starting_positions = EMPTY_MARK * size * size
      Board.new(starting_positions.split(''))
    end

    def initialize(positions)
      @positions = positions
    end

    def move(index, marker)
      new_positions = positions.dup
      new_positions[index] = marker
      Board.new(new_positions)
    end

    def is_available?(index)
      positions[index] == EMPTY_MARK
    end

    def available_moves
      positions.each_index.select do |index|
        is_available?(index)
      end
    end

    def finished?
      line_win = WINNING_ROWS.any? do |winning_row|
        row_has_winner?(winning_row)
      end
      line_win || available_moves.length == 0
    end

    def all_moves
      (0...positions.length).to_a
    end

    def marker_at(index)
      positions[index]
    end

    private

    def row_has_winner?(row)
      (1...row.length).each do |index|
        return false if positions[row[index]] == EMPTY_MARK || first_in_row(row) != positions[row[index]]
      end
      true
    end

    def first_in_row(row)
      positions[row[0]]
    end
  end
end
