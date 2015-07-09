require 'spec_helper'
require 'tic_tac_toe_core/board'
require 'tic_tac_toe_core/computer_player'

module TicTacToeCore
  describe ComputerPlayer do
    let(:x_player) { ComputerPlayer.new('X') }
    let(:o_player) { ComputerPlayer.new('O') }
          
    it "makes a valid board move" do
      board = Board.create_empty
      next_move = x_player.next_move(board)

      expect(board.is_available?(next_move)).to be true
    end

    it "has a marker" do
      expect(x_player.marker).to eq('X')
    end

    it "chooses the only available move" do
      board = create_board(3, 'XOXXOXOX-')
      expect(o_player.next_move(board)).to eq(8)
    end

    it "chooses the winning move out of 2 possible moves when X player" do
      board = create_board(3, 
                           'XOX' +
                           'XOX' +
                           'O--')
      expect(x_player.next_move(board)).to eq(8)
    end

    it "chooses the winning move out of 2 possible moves when O player" do
      board = create_board(3, 
                           'OXO' +
                           'OXO' +
                           'X--')
      expect(o_player.next_move(board)).to eq(8)
    end

    it "chooses the blocking move out of 2 possible moves when the O player" do
      board = create_board(3, 
                           'XOX' +
                           'OXX' +
                           'O--')
      expect(o_player.next_move(board)).to eq(8)
    end

    it "chooses the blocking move out of 2 possible moves when the X player" do
      board = create_board(3, 
                           'OXO' +
                           'XOO' +
                           'X--')
      expect(x_player.next_move(board)).to eq(8)
    end

    it "test a slow move in 4x4", :slow => true do
      board = create_board(4,
                           'O---' +
                           '-O--' +
                           '--O-' +
                           '-XX-')
      expect(o_player.next_move(board)).to eq(15)
    end

    it "test a slow move in 4x4", :slow => true do
      board = create_board(4,
                           '-O--' +
                           '-O--' +
                           '-OX-' +
                           '---X')
      expect(o_player.next_move(board)).to eq(13)
    end

    def create_board(size, string_positions)
      Board.new(size, string_positions.split(''))
    end
  end
end
