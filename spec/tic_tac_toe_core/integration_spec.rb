require 'spec_helper'
require 'tic_tac_toe_core/game'
require 'tic_tac_toe_core/computer_player'
require 'tic_tac_toe_core/board'

module TicTacToeCore
  describe 'full game' do
    it 'plays a full game which ends with the game not running anymore' do
      ui = double('UI').as_null_object
      players = [ComputerPlayer.new('X'), ComputerPlayer.new('O')]
      board = Board.create_empty
      game = Game.new(board, players, ui)
      game.run
      expect(game.running?).to be false
    end

    it 'players a full 4x4 game' do
      ui = double('UI').as_null_object
      players = [ComputerPlayer.new('X'), ComputerPlayer.new('O')]
      board = Board.create_empty(4)
      game = Game.new(board, players, ui)
      game.run
      expect(game.running?).to be false
    end
  end
end
