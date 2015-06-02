require_relative "slidingpiece.rb"

class Bishop < SlidingPiece

  def move_dirs

    {:upright => [-1,1], :upleft => [-1, -1], :downleft => [1, -1], :downright => [1, 1]}

  end



end
