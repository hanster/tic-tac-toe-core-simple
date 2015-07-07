require 'spec_helper'
require 'tic_tac_toe_core/board'

module TicTacToeCore
  describe Board do
    let (:empty_mark) { Board::EMPTY_MARK }
    let (:empty_three_board) { Board.create_empty }
    let (:x_marker) { 'X' }
    let (:o_marker) { 'O' }

    it "starts as an empty board" do
      expect(empty_three_board.positions).to eq([empty_mark, empty_mark, empty_mark,
                                                 empty_mark, empty_mark, empty_mark,
                                                 empty_mark, empty_mark, empty_mark])
    end

    it "starts as an empty 4x4 board" do
      board = Board.create_empty(4)
      expect(board.positions).to eq([empty_mark, empty_mark, empty_mark, empty_mark,
                                     empty_mark, empty_mark, empty_mark, empty_mark,
                                     empty_mark, empty_mark, empty_mark, empty_mark,
                                     empty_mark, empty_mark, empty_mark, empty_mark])
    end

    it "places a marker in the correct position" do
      next_board = empty_three_board.move(0, x_marker)
      expect(next_board.positions).to eq([x_marker, empty_mark, empty_mark,
                                          empty_mark, empty_mark, empty_mark,
                                          empty_mark, empty_mark, empty_mark])
    end

    it "places a marker which does not affect the previous board" do
      next_board = empty_three_board.move(0, x_marker)
      expect(empty_three_board.positions).to eq([empty_mark, empty_mark, empty_mark,
                                                 empty_mark, empty_mark, empty_mark,
                                                 empty_mark, empty_mark, empty_mark])

      expect(next_board.positions).to eq([x_marker, empty_mark, empty_mark,
                                          empty_mark, empty_mark, empty_mark,
                                          empty_mark, empty_mark, empty_mark])
    end

    it "a position is not available once a move has been made there" do
      next_board = empty_three_board.move(0, x_marker)
      expect(next_board.is_available?(0)).to be false
    end

    it "returns all available moves" do
      expect(empty_three_board.available_moves).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8])
    end

    it "returns all available moves after a move has been made" do
      next_board = empty_three_board.move(2, x_marker)
      expect(next_board.available_moves).to eq([0, 1, 3, 4, 5, 6, 7, 8])
    end

    it "is not finished when you create an empty board" do
      expect(empty_three_board.finished?).to be false
    end

    it "is finished when the board is full" do
      board = Board.new([x_marker, x_marker, x_marker,
                         x_marker, x_marker, x_marker,
                         x_marker, x_marker, x_marker])
      expect(board.finished?).to be true
    end

    it "is finished when the board has a winner" do
      board = Board.new([x_marker, x_marker, x_marker,
                         empty_mark, empty_mark, empty_mark,
                         empty_mark, empty_mark, empty_mark])
      expect(board.finished?).to be true
    end

    it "is not finished when the board has a row with an empty marker" do
      board = Board.new([x_marker, empty_mark, x_marker,
                         empty_mark, empty_mark, empty_mark,
                         empty_mark, empty_mark, empty_mark])
      expect(board.finished?).to be false
    end

    it "checks all the middle horizontal row will cause a finished board" do
      board = Board.new([empty_mark, empty_mark, empty_mark,
                         x_marker, x_marker, x_marker,
                         empty_mark, empty_mark, empty_mark])
      expect(board.finished?).to be true
    end

    it "checks all the bottom horizontal row will cause a finished board" do
      board = Board.new([empty_mark, empty_mark, empty_mark,
                         empty_mark, empty_mark, empty_mark,
                         x_marker, x_marker, x_marker])
      expect(board.finished?).to be true
    end

    it "checks all the left vertical row will cause a finished board" do
      board = Board.new([x_marker, empty_mark, empty_mark,
                         x_marker, empty_mark, empty_mark,
                         x_marker, empty_mark, empty_mark])
      expect(board.finished?).to be true
    end

    it "checks all the middle vertical row will cause a finished board" do
      board = Board.new([empty_mark, x_marker, empty_mark,
                         empty_mark, x_marker, empty_mark,
                         empty_mark, x_marker, empty_mark])
      expect(board.finished?).to be true
    end

    it "checks all the right vertical row will cause a finished board" do
      board = Board.new([empty_mark, empty_mark, x_marker,
                         empty_mark, empty_mark, x_marker,
                         empty_mark, empty_mark, x_marker])
      expect(board.finished?).to be true
    end

    it "checks all the top left to bottom right diagonal row will cause a finished board" do
      board = Board.new([x_marker, empty_mark, empty_mark,
                         empty_mark, x_marker, empty_mark,
                         empty_mark, empty_mark, x_marker])
      expect(board.finished?).to be true
    end

    it "checks all the top right to bottom left diagonal row will cause a finished board" do
      board = Board.new([empty_mark, empty_mark, x_marker,
                         empty_mark, x_marker, empty_mark,
                         x_marker, empty_mark, empty_mark])
      expect(board.finished?).to be true
    end

    it "returns all move indices" do
      expect(empty_three_board.all_moves).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8])
    end

    it "returns the marker at a specific position" do
      next_board = empty_three_board.move(0, x_marker).move(1, o_marker)
      expect(next_board.marker_at(0)).to eq(x_marker)
      expect(next_board.marker_at(1)).to eq(o_marker)
    end

    it "returns won? as true if someone has won" do
      board = Board.new([x_marker, empty_mark, empty_mark,
                         x_marker, empty_mark, empty_mark,
                         x_marker, empty_mark, empty_mark])
      expect(board.won?).to be true
    end

    it "return tie? true if the board is full and noone has won"do
      board = Board.new([x_marker, o_marker, x_marker,
                         x_marker, o_marker, x_marker,
                         o_marker, x_marker, o_marker])
      expect(board.tie?).to be true
    end

    it "returns the winner as x marker" do
      board = Board.new([x_marker, empty_mark, empty_mark,
                         x_marker, empty_mark, empty_mark,
                         x_marker, empty_mark, empty_mark])
      expect(board.winner).to eq(x_marker)
    end

    it "returns the winner as o marker" do
      board = Board.new([o_marker, empty_mark, empty_mark,
                         o_marker, empty_mark, empty_mark,
                         o_marker, empty_mark, empty_mark])
      expect(board.winner).to eq(o_marker)
    end

    it "returns the number of moves made" do
      board = Board.create_empty
      expect(board.moves_made).to eq(0)
    end
  end
end
