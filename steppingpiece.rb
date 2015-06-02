require_relative "piece.rb"

class SteppingPiece < Piece


  def all_moves

    results = []
    directions = self.move_dirs
    directions.each do |direction, delta|

        new_row = (row + (delta[0]))
        new_col = col + (delta[1])
        results << [new_row, new_col]
      end

    
    results
  end

  def move_filter(moves)
    results = []
    moves.each do |position|
      current_row = position[0]
      current_col = position[1]
      inside_board = current_row.between?(0,7) && current_col.between?(0,7)
      not_original_position = !(position[0] == row && position[1] == col)

        results << position if inside_board && not_original_position
    end
    results

  end

  def moves
    move_filter(self.all_moves)

  end
end
