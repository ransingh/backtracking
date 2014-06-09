require 'backtracking_problem'
require 'chessboard'
require 'solution'

module Chess
  class EightQueensProblem < ::BacktrackingProblem

    def initialize()
      @solutions = []
    end

    def root()
      Chess::Chessboard.initial_positions.map { |p|  Chess::Solution.with(p)}
    end

    def reject?(candidate_solution)
      result = !candidate_solution.current_position_acceptable?
      result
    end

    def accept?(candidate_solution)
      candidate_solution.all_queens_placed?
    end

    def first_extension(candidate_solution)
      candidate_solution.first_extension
    end

    def next_alternate_extension(candidate_solution)
      candidate_solution.next_alternate_extension
    end

    def output(candidate_solution)
      @solutions << candidate_solution
    end

    def to_s
      @solutions.reduce(""){|m,s| m = m + s.to_s + "\n"} + "\n Total:: #{@solutions.size} \n"
    end
  end # EightQueensProblem
end # Chess
