module TicTacToeCore
  class NegamaxAi
    START_ALPHA = -100
    START_BETA = 100
    START_VALUE = -100
    DEPTH_LIMIT = 7

    Move = Struct.new(:index, :value)

    def next_move(board, marker)
      move = negamax(board, START_ALPHA, START_BETA, DEPTH_LIMIT, marker)
      move.index
    end

    private

    def negamax(board, alpha, beta, depth, marker)
      best_value = START_VALUE
      best_index = :NO_INDEX
      return  evaluated_move(board, depth, marker) if can_evaluate?(depth, board)
      board.available_moves.each do |move|
        next_board = board.move(move, marker)
        node_value = -negamax(next_board, -beta, -alpha, depth - 1, opponent(marker)).value
        if node_value > best_value
          best_index = move
          best_value = node_value
        end
        alpha = [alpha, node_value].max
        break if alpha >= beta
      end
      return Move.new(best_index, best_value)
    end

    def can_evaluate?(depth, board)
      depth == 0 || board.finished?
    end

    def evaluated_move(board, depth, marker)
      Move.new(:NO_INDEX, node_value(board, depth, marker))
    end

    def node_value(board, depth, marker)
      winner = board.winner
      if winner == nil
        0
      elsif winner == marker
        100
      else
        -100
      end
    end

    def opponent(marker)
      marker == 'X' ?  'O' : 'X'
    end
  end
end
