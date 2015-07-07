require 'spec_helper'
require 'tic_tac_toe_core/game_setup'

module TicTacToeCore
  describe GameSetup do
    let(:ui) { double('UI').as_null_object }
    let(:setup) { GameSetup.new(ui) }

    it "builds a game from ui inputs" do
      expect(ui).to receive(:get_board_type)
      expect(ui).to receive(:get_players_type)
      expect(setup.build_game).to be_kind_of(Game)
    end

    it "builds a game with a board of size 3" do
      allow(ui).to receive(:get_board_type).and_return(3)
      game = setup.build_game
      expect(game.board.size).to eq(3)
    end

    it "builds a game with a board of size 4" do
      allow(ui).to receive(:get_board_type).and_return(4)
      game = setup.build_game
      expect(game.board.size).to eq(4)
    end

    it "builds a game with a human vs human player set up" do
      allow(ui).to receive(:get_board_type).and_return(3)
      allow(ui).to receive(:get_players_type).and_return(GameSetup::HVH_GAME_TYPE)
      game = setup.build_game
      expect_players_to_be(game.players, HumanPlayer, HumanPlayer)
    end

    it "builds a game with a computer vs human player set up" do
      allow(ui).to receive(:get_board_type).and_return(3)
      allow(ui).to receive(:get_players_type).and_return(GameSetup::CVH_GAME_TYPE)
      game = setup.build_game
      expect_players_to_be(game.players, ComputerPlayer, HumanPlayer)
    end

    it "builds a game with a human vs computer player set up" do
      allow(ui).to receive(:get_board_type).and_return(3)
      allow(ui).to receive(:get_players_type).and_return(GameSetup::HVC_GAME_TYPE)
      game = setup.build_game
      expect_players_to_be(game.players, HumanPlayer, ComputerPlayer)
    end

    it "builds a game with a computer vs computer player set up" do
      allow(ui).to receive(:get_board_type).and_return(3)
      allow(ui).to receive(:get_players_type).and_return(GameSetup::CVC_GAME_TYPE)
      game = setup.build_game
      expect_players_to_be(game.players, ComputerPlayer, ComputerPlayer)
    end

    it "returns the player options" do
      expect(GameSetup.get_player_options).to eq(["Human vs Human", "Computer vs Human", "Human vs Computer", "Computer vs Computer"])
    end

    it "returns the board options" do
      expect(GameSetup.get_board_options).to eq(["2x2", "3x3", "4x4"])
    end

    def expect_players_to_be(players, player_1, player_2)
      expect(players[0]).to be_kind_of(player_1)
      expect(players[1]).to be_kind_of(player_2)
    end
  end
end
