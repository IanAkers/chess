require_relative "slidingpiece.rb"

class Queen < SlidingPiece

  def move_dirs
    DIAG_DELTAS + UP_DOWN_DELTAS


  end



end
