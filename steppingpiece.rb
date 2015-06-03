require_relative "piece.rb"

class SteppingPiece < Piece


  def moves

    results = Array.new([])

    directions = self.move_dirs
    directions.each do |direction, delta|
      sub_results = []
        new_row = (row + (delta[0]))
        new_col = col + (delta[1])
        next if !(in_bounds?(new_row, new_col))
         unless friend_occupied?(new_row, new_col)
          sub_results << [new_row, new_col]
         end
         results << sub_results if !sub_results.empty?
      end

    results
  end


end
