require_relative "piece.rb"

class Pawn < Piece


def move_dirs

  if color ==  :black
      {:down => [1,0], :double_down => [2,0],
      :down_right => [1,1], :down_left => [1,-1]}

  else
      {:up => [-1,0], :double_up => [-2,0],
      :up_right => [-1,1], :up_left => [-1, -1]}

  end
end

def moves
  results = Array.new([])
  directions = self.move_dirs
  directions.each do |direction, delta|
    new_row = row + (delta[0])
    new_col = col + (delta[1])

    next if !(in_bounds?(new_row, new_col))

    unless friend_occupied?(new_row, new_col)

      #conditional for "double" moves
      if (direction == :double_up || direction == :double_down)
        unless double_moves(new_row, new_col).empty? && forward_moves(new_row, new_col).empty?
          results << [double_moves(new_row, new_col)]
        end


      #conditional for up/down moves
      elsif (direction == :up || direction == :down)
        unless forward_moves(new_row, new_col).empty?
          results << [forward_moves(new_row, new_col)]
        end


     #conditional for diagonal moves
      else
        unless diagonal_moves(new_row, new_col).empty?
          results << [diagonal_moves(new_row, new_col)]
        end
      end

   end

  end

results

end

  def double_moves(new_row, new_col)

    results = []
    unless enemy_occupied?(new_row, new_col)
      #unless black piece has moved
      if self.color == :black && self.row == 1
        results += [new_row, new_col]
      end
      #unless white piece has moved
      if self.color == :white && self.row == 6
        results += [new_row, new_col]
      end
    end
    results
  end

  def forward_moves(new_row, new_col)
    results = []
    unless enemy_occupied?(new_row, new_col)
      results += [new_row, new_col] if in_bounds?(new_row, new_col)
    end
    results

  end

  def diagonal_moves(new_row, new_col)
    results = []
    if enemy_occupied?(new_row, new_col)
      results += [new_row, new_col] if in_bounds?(new_row, new_col)
    end
    results
  end

end
