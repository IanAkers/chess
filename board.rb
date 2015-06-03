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
end

def move(start_pos, end_pos)
  if self[start_pos[0], start_pos[1]].nil?
    puts "Please select a valid start position"
    return nil
  end

  piece = self[start_pos[0], start_pos[1]]
  if !(piece.moves.values.include?([end_pos]))
    puts "Not a valid move"
    return nil
  end
debugger
  #move_into_check?
    unless move_into_check?(start_pos, end_pos)
      self[end_pos[0], end_pos[1]] = piece
      destroy_at(start_pos[0], start_pos[1])
    end
  end


  def move_into_check?(start_pos, end_pos)
    new_board = self.dup
    piece = new_board[start_pos[0], start_pos[1]]
    new_board[end_pos[0], end_pos[1]] = piece
    new_board.destroy_at(start_pos[0], start_pos[1])

    current_player = self[start_pos[0],start_pos[1]].color

    new_board.in_check?(current_player)
  end

  def dup

    new_board = Board.new
    grid.each do |old_row|
      old_row.each do |old_piece|
        unless old_piece.nil?
          old_piece.dup(new_board)
        end
      end
    end

    new_board
  end

def destroy_at(new_row, new_col)
  grid[new_row][new_col] = nil
end

def in_check?(color)

  king_position = find_king_position(color)

  moves_array = []
  grid.each_with_index do |row, row_index|
    row.each_with_index do |col, col_index|

      unless grid[row_index][col_index].nil?
        piece = grid[row_index][col_index]
         piece.moves.values.each do |value|
           moves_array += value
         end
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
  queen = Queen.new(2,2,:white,board1)
  p board1[1,3].moves
  board1.move([1,3],[3,3])
  p queen.moves
  p board1.move_into_check?([1,3],[3,3])



end
