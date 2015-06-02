class Piece
  attr_accessor :row, :col

  def initialize(row, col, board)
    @row = row
    @col = col
    @board = board
  end

  def moves
  end

end
