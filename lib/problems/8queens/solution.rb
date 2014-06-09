require 'chessboard'

module Chess
  class Solution

    attr_accessor :queen_positions, :placed_queen_count

    class << self
      def with(position)
        self.new.tap do |s|
          s.placed_queen_count += 1
          s.queen_positions[s.placed_queen_count-1] = position
        end
      end
    end

    def initialize()
      @queen_positions = Array.new(8)
      @placed_queen_count = 0
    end

    def all_queens_placed?
      !!@queen_positions.reduce{|memo,pos| memo = memo && pos }
    end

    def current_position_acceptable?
      # if there is only on queen place, cannot have any conflict
      return true if @placed_queen_count == 1

      current_position = @queen_positions[@placed_queen_count -1]

      result = []
      idx = 0
      while(idx < @placed_queen_count - 1)
        position = @queen_positions[idx]

        r1 = position.row_conflict_with?(current_position)
        r2 = position.column_conflict_with?(current_position)
        r3 = position.diagonal_conflict_with?(current_position)

        result <<  (r1 || r2 || r3)
        idx += 1
      end

      !result.reduce{|m,r| m = m||r} # combine all the truthy & falsy value usig OR
    end

    def first_extension
      current_position = @queen_positions[@placed_queen_count - 1]
      next_position = Chess::Chessboard.next_row_position(current_position)
      return nil unless next_position

      new_candidate_solution = self.dup
      raise "more than 8 queens placed for position:: #{position}" if new_candidate_solution.placed_queen_count == 8
      new_candidate_solution.placed_queen_count += 1
      new_candidate_solution.queen_positions[new_candidate_solution.placed_queen_count - 1] = next_position
      new_candidate_solution
    end

    def next_alternate_extension
      current_position = @queen_positions[@placed_queen_count - 1]
      next_position = Chess::Chessboard.next_col_position(current_position)
      return nil unless next_position

      new_candidate_solution = self.dup
      new_candidate_solution.queen_positions[new_candidate_solution.placed_queen_count - 1] = next_position
      new_candidate_solution
    end

    def dup
      self.class.new.tap do |solution|
        solution.queen_positions = self.queen_positions.dup
        solution.placed_queen_count = self.placed_queen_count
      end
    end

    def to_s
      " #{@queen_positions}"
    end
  end
end