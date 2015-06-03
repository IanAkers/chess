require_relative "piece.rb"

class SteppingPiece < Piece


  def moves

    results = Hash.new([])

    directions = self.move_dirs
    directions.each do |direction, delta|

        new_row = (row + (delta[0]))
        new_col = col + (delta[1])
        next if !(in_bounds?(new_row, new_col))
         unless friend_occupied?(new_row, new_col)
          results[direction] += [[new_row, new_col]]
         end
      end

      # results = results.collect { |key, value| value.count() ==  1 ? value : value }
    results
  end


end
