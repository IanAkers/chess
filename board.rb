require_relative 'piece.rb'
require_relative 'pawn.rb'
require_relative 'rook.rb'
require_relative 'knight.rb'
require_relative 'bishop.rb'
require_relative 'king.rb'
require_relative 'queen.rb'
require 'byebug'

class Board

    PAWNS = [[[1,0], [1,1], [1,2], [1,3], [1,4], [1,5], [1,6], [1,7]],
          [[6,0], [6,1], [6,2], [6,3], [6,4], [6,5], [6,6], [6,7]]]

  ROOKS = [[[0,0], [0,7]], [[7,0], [7,7]]]

  KNIGHTS = [[[0,1], [0,6]], [[7,1], [7,6]]]

  BISHOPS = [[[0,2], [0,5]], [[7,2], [7,5]]]

  QUEENS = [[[0,3]], [[7,3]]]

  KINGS = [[[0,4]], [[7,4]]]

  attr_accessor :grid, :pawns

def initialize
  @grid = Array.new(8) {Array.new(8)}
end

  def [](input)
    input = input.to_s unless input.is_a?(String)
    array = input.split("")
    row = array[0].ord - 97
    col = (array[1].to_i - 1)
    @grid[row][col]
  end

  def populate_board
    populate_pawns
    populate_rooks
    populate_knights
    populate_bishops
    populate_kings
    populate_queens
    self
  end


  def populate_pawns
    PAWNS.each_with_index do |color_array, index|
      color_array.each do |pos|
        if index == 0
          grid[pos[0], pos[1]] = Pawn.new(pos[0], pos[1], :black, self)
        else
          grid[pos[0], pos[1]] = Pawn.new(pos[0], pos[1], :white, self)
        end
      end
    end

  end

  def populate_rooks
    ROOKS.each_with_index do |color_array, index|
      color_array.each do |pos|
        if index == 0
          grid[pos[0], pos[1]] = Rook.new(pos[0], pos[1], :black, self)
        else
          grid[pos[0], pos[1]] = Rook.new(pos[0], pos[1], :white, self)
        end
      end
    end

  end

  def populate_knights
    KNIGHTS.each_with_index do |color_array, index|
      color_array.each do |pos|
        if index == 0
          grid[pos[0], pos[1]] = Knight.new(pos[0], pos[1], :black, self)
        else
          grid[pos[0], pos[1]] = Knight.new(pos[0], pos[1], :white, self)
        end
      end
    end

  end

  def populate_bishops
    BISHOPS.each_with_index do |color_array, index|
      color_array.each do |pos|
        if index == 0
          grid[pos[0], pos[1]] = Bishop.new(pos[0], pos[1], :black, self)
        else
          grid[pos[0], pos[1]] = Bishop.new(pos[0], pos[1], :white, self)
        end
      end
    end

  end

  def populate_queens
    QUEENS.each_with_index do |color_array, index|
      color_array.each do |pos|
        if index == 0
          grid[pos[0], pos[1]] = Queen.new(pos[0], pos[1], :black, self)
        else
          grid[pos[0], pos[1]] = Queen.new(pos[0], pos[1], :white, self)
        end
      end
    end

  end

  def populate_kings
    KINGS.each_with_index do |color_array, index|
      color_array.each do |pos|
        if index == 0
          grid[pos[0], pos[1]] = King.new(pos[0], pos[1], :black, self)
        else
          grid[pos[0], pos[1]] = King.new(pos[0], pos[1], :white, self)
        end
      end
    end

  end

end
