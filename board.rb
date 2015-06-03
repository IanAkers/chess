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

  def display
    results = []

    grid.each do |row|
      sub_results = []

      row.each do |piece|
        if piece.class == NilClass
          sub_results << nil
        else
        sub_results << piece.class
        end
      end

      results << sub_results
    end

    results.each do |row|
      puts row
    end
  end

def [](new_row, new_col)
  grid[new_row][new_col]
end

def []= (new_row, new_col, piece)
  grid[new_row][new_col] = piece
  old_row = piece.row
  old_col = piece.col
  piece.row, piece.col = new_row, new_col

  if old_row != piece.row && old_col != piece.col
    grid[old_row][old_col] = nil
  end
end


def in_check?(color)

  king_position = find_king_position(color)

  moves_array = []
  grid.each_with_index do |row, row_index|
    row.each_with_index do |col, col_index|

      unless grid[row_index][col_index].nil?
        piece = grid[row_index][col_index]
        moves_array += piece.moves.values
      end
    end

    end
    debugger
    moves_array.include?(king_position)
  end


def find_king_position(color)
  king_position = []
  grid.each_with_index do |row, row_index|
    row.each_with_index do |col, col_index|
      if grid[row_index][col_index].is_a?(King) && grid[row_index][col_index].color == color
        king_position = [row_index, col_index]
      end
    end
  end

  king_position


end

  # def [](input)
  #   input = input.to_s unless input.is_a?(String)
  #   array = input.split("")
  #   row = array[0].ord - 97
  #   col = (array[1].to_i - 1)
  #   @grid[row][col]
  # end

  def populate_board
    populate(PAWNS,Pawn)
    populate(ROOKS,Rook)
    populate(KNIGHTS, Knight)
    populate(BISHOPS, Bishop)
    populate(KINGS, King)
    populate(QUEENS, Queen)
    self
  end


  def populate(constant, class_var)
    constant.each_with_index do |color_array, index|
      color_array.each do |pos|
        if index == 0
          self[pos[0],pos[1]] = class_var.new(pos[0], pos[1], :black, self)
        else
          self[pos[0],pos[1]] = class_var.new(pos[0], pos[1], :white, self)
        end
      end
    end
  end


end

if __FILE__ == $PROGRAM_NAME
  board1 = Board.new
  board1.populate_board
  rook = board1[0,0]
  p board1.in_check?(:black)
end
