require_relative "piece.rb"

class SlidingPiece < Piece
  DIAG_DELTAS = []
  UP_DOWN_DELTAS = []

  def moves
    array = self.move_dirs

  end

end
