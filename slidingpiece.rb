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

        results[direction] += [[new_row, new_col]] if in_bounds?(new_row, new_col)

      end

    end
    results
  end

  def in_bounds?(new_row, new_col)
    inside_board = new_row.between?(0,7) && new_col.between?(0,7)
    not_original_position = !(new_row == row && new_col == col)
    return false unless inside_board && not_original_position
    true
  end

  def enemy_occupied?(new_row, new_col)
    occupied = !board[new_row, new_col].nil?
    if occupied
      target_color = board[new_row, new_col].color
      enemy = (target_color != self.color)
    end
    return true if occupied && enemy
    false

  end

  def friend_occupied?(new_row, new_col)
    occupied = !board[new_row, new_col].nil?
    if occupied
      target_color = board[new_row, new_col].color
      friend = (target_color == self.color)
    end
    return true if occupied && friend
    false

  end


  def moves


  end

end
