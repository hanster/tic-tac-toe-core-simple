require 'spec_helper'
require 'tic_tac_toe_core/board'

module TicTacToeCore
  describe Board do
    let (:empty_mark) { Board::EMPTY_MARK }
    it "starts as an empty board" do
      board = Board.create_empty
      expect(board.positions).to eq([empty_mark, empty_mark, empty_mark,
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

    it "" do

    end
  end
end
