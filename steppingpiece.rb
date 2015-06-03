require_relative "piece.rb"

class SteppingPiece < Piece


  def moves

    results = Hash.new([])

    directions = self.move_dirs
    directions.each do |direction, delta|

        new_row = (row + (delta[0]))
        new_col = col + (delta[1])
         unless friend_occupied?(new_row, new_col)
          results[direction] += [[new_row, new_col]] if in_bounds?(new_row, new_col)
         end
      end


    results
  end


end
