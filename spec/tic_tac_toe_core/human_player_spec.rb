require 'spec_helper'
require 'tic_tac_toe_core/human_player'

module TicTacToeCore
  describe HumanPlayer do
    let (:ui) { double('UI').as_null_object }
    let(:player) { HumanPlayer.new('X', ui) }

    it "makes a next move by asking the ui for a move" do
      board = double('Board').as_null_object
      expect(ui).to receive(:prompt_for_move)
      player.next_move(board)
    end

    it "has a marker" do
      expect(player.marker).to eq('X')
    end
  end
end
