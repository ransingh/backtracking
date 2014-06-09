module Chess
  # board has 64 positions in 8 X 8 matrix
  # label rows as    : 1 -- 8
  # label columns as : a -- h
  # 8
  # 7
  # 6
  # 5
  # 4
  # 3
  # 2  X
  # 1  *  Y
  #    1  2  3  4  5  6  7  8
  #  lets  say we start at '*' position, then
  #  X - is next row  position
  #  Y - is next column position
  class Chessboard
    class << self
      def initial_positions
        pos = []
        Position::MIN_COLUMN_POSITION.upto(Position::MAX_COLUMN_POSITION) do | col |
          pos << Position.new(Position::MIN_ROW_POSITION, col)
        end
        pos
      end

      def next_row_position(position)
        next_position = if new_row = Position.next_row(position.row)
            Position.new(new_row, Position::MIN_COLUMN_POSITION)
          else
            nil
          end
        return next_position
      end

      def next_col_position(position)
        next_position = if new_col = Position.next_column(position.column)
            Position.new(position.row, new_col)
          else
            nil
          end
        return next_position
      end
    end
  end # Chessboard

  class Position
    MIN_ROW_POSITION = 1
    MAX_ROW_POSITION = 8

    MIN_COLUMN_POSITION = 1
    MAX_COLUMN_POSITION = 8

    attr_accessor :row, :column

    class << self
      def next_column(col)
        return nil if col == Position::MAX_COLUMN_POSITION
        col + 1
      end

      def next_row(row)
        return nil if row == Position::MAX_ROW_POSITION
        row + 1
      end

      def initial_position
        self.new(1,1)
      end
    end # class << self

    def initialize(row, column)
      @row = row # 1 - 8
      @column = column # 1 - 8
    end

    def row_conflict_with?(position)
      #puts "#{__method__}: #{@row} #{position} => #{@row == position.row}"
      @row == position.row
    end

    def column_conflict_with?(position)
      #puts "#{__method__}: #{@column} #{position} => #{@column == position.column}"
      @column == position.column
    end

    def same_as?(position)
      @row == position.row && @column == position.column
    end

    def diagonal_conflict_with?(position)
      diagonal_positions.reduce(false) do |memo, diagonal_position|
        memo = memo || position.same_as?(diagonal_position)
      end
    end

    def to_s
      "[#{row}, #{column}]"
    end

    private

    def diagonal_positions
      pos = []
      pos += top_right_diagonal_positions(@row, @column)
      pos += bottom_right_diagonal_positions(@row, @column)
      pos += bottom_left_diagonal_positions(@row, @column)
      pos += top_left_diagonal_positions(@row, @column)
      pos
    end

    def top_right_diagonal_positions(row, column)
      pos = []
      while (row <= Position::MAX_ROW_POSITION && column <= Position::MAX_COLUMN_POSITION)
        pos << Position.new(row, column)
        row, column = row + 1, column + 1
      end
      pos
    end

    def bottom_right_diagonal_positions(row, column)
      pos = []
      while (row >= Position::MIN_ROW_POSITION && column <= Position::MAX_COLUMN_POSITION)
        pos << Position.new(row,column)
        row, column = row - 1, column + 1
      end
      pos
    end

    def bottom_left_diagonal_positions(row, column)
      pos = []
      while (row >= Position::MIN_ROW_POSITION && column >= Position::MIN_COLUMN_POSITION)
        pos << Position.new(row,column)
        row, column = row - 1, column - 1
      end
      pos
    end

    def top_left_diagonal_positions(row, column)
      pos = []
      while (row <= Position::MAX_ROW_POSITION && column >= Position::MIN_COLUMN_POSITION)
        pos << Position.new(row,column)
        row, column = row + 1, column - 1
      end
      pos
    end
  end # Position
end # Chess


