require_relative "slidingpiece.rb"

class Rook < SlidingPiece

  def move_dirs
    {:down => [1,0], :up => [-1, 0], :left => [0, -1], :right => [0, 1]}
  end



end
