require_relative "piece.rb"

class Pawn < Piece

#direciton depends on color

#can move 2 spaces in first move

#moves diagonal to take a piece

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
  results = Hash.new()
  directions = self.move_dirs
  directions.each do |direction, delta|


    new_row = row + (delta[0])
    new_col = col + (delta[1])
    unless friend_occupied?(new_row, new_col)

    #conditional for "double" moves
      if delta[0] != (1 || -1)
        results[direction] = double_moves(new_row, new_col)
       end
     end

     #conditional for up/down moves



     #conditional for diagonal moves

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

end
