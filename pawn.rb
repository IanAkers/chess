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




end
