require 'spec_helper'
require 'tic_tac_toe_core/computer_player'

module TicTacToeCore
  describe ComputerPlayer do
    let(:player) { ComputerPlayer.new('X') }
          
    it "makes a valid board move" do
      board = Board.create_empty
      next_move = player.next_move(board)

      expect(board.is_available?(next_move)).to be true
    end

    it "has a marker" do

      expect(player.marker).to eq('X')
    end
  end
end
