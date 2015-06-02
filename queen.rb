require_relative "slidingpiece.rb"

class Queen < SlidingPiece

  def move_dirs
    {:upright => [-1,1], :upleft => [-1, -1], :downleft => [1, -1],
      :downright => [1, 1], :down => [1,0], :up => [-1, 0],
      :left => [0, -1], :right => [0, 1]}
  end



end
