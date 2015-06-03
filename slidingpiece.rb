require_relative "piece.rb"
require 'byebug'
class SlidingPiece < Piece

  def all_moves

    results = Hash.new([])
    directions = self.move_dirs
    directions.each do |direction, delta|

      1.upto(8) do |idx|
        new_row = (row + (delta[0]*idx))
        new_col = col + (delta[1]*idx)
        break if friend_occupied?(new_row, new_col)
        results[direction] += [[new_row, new_col]] if in_bounds?(new_row, new_col)
        break if enemy_occupied?(new_row, new_col)
      end

    end
    results
  end


  def moves


  end

end
