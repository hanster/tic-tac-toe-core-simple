require 'spec_helper'
require 'tic_tac_toe_core/game'

module TicTacToeCore
  describe Game do
    let(:ui) { double("UI").as_null_object }
    let(:player1) { PlayerStub.new('X') }
    let(:player2) { PlayerStub.new('O') }
    let(:players) { [player1, player2] }

    def new_board(positions)
      Board.new(3, positions.split(''))
    end

    it "is running when the board is not finished"do
      board = Board.create_empty
      game = Game.new(board, players, ui)
      expect(game.running?).to eq(true)
    end

    it "is not running when the board is finished" do
      board = new_board('XXX------')
      game = Game.new(board, players, ui)
      expect(game.running?).to eq(false)
    end

    it "plays a turn which will ask the current player to make a move on the board" do
      board = Board.create_empty
      game = Game.new(board, players, ui)
      game.play_turn
    end
    
    it "draws the ui" do
      expect(ui).to receive(:draw)
      board = Board.create_empty
      game = Game.new(board, players, ui)
      game.run
    end

    it "tell the game to make a move for the current player" do
      board = double('Board').as_null_object
      game = Game.new(board, players, ui)
      expect(board).to receive(:move)
      game.make_move(0)
    end
  end

  class PlayerStub
    attr_reader :marker

    def initialize(marker)
      @marker = marker
    end

    def next_move(board)
      board.available_moves.sample
    end
  end
end
