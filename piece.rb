class Piece
  attr_accessor :row, :col, :color, :board

  def initialize(row, col, color, board)
    @row = row
    @col = col
    @board = board
    @color = color
  end

  def moves
  end

end
