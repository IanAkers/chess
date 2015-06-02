require_relative "piece.rb"

class SteppingPiece < Piece


  def moves

    sub_results = []
    directions = self.move_dirs
    directions.each do |direction, delta|
        new_row = (row + (delta[0]))
        new_col = col + (delta[1])
        sub_results << [new_row, new_col]
      end


    results = []
    sub_results.each do |position|
      current_row = position[0]
      current_col = position[1]

      inside_board = current_row.between?(0,7) && current_col.between?(0,7)
      not_original_position = !(position[0] == row && position[1] == col)

        results << position if inside_board && not_original_position

    end
    
    results
  end
end
