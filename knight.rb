require_relative "steppingpiece.rb"

class Knight < SteppingPiece

  def move_dirs
    {:right2up1 => [-1, 2], :right1up2 => [-2, 1],
     :left2up1 => [-1, -2], :left1up2 => [-2, -1],
     :right2down1 => [1, 2], :right1down2 => [2, 1],
     :left2down1 => [1, -2], :left1down2 => [2, -1]}
  end
end
