module TicTacToeCore
  class HumanPlayer
    attr_reader :user_interface, :marker

    def initialize(marker, user_interface)
      @marker = marker
      @user_interface = user_interface
    end

    def next_move(board)
      user_interface.prompt_for_move(board, marker)
    end
  end
end
