require_relative 'board'

class Game

  attr_reader :board, :player

  def initialize
    @board = Board.new
    @player = 1
  end

  def update_board(move)
    horizontal_axis = move[0]
    vertical_axis = move[1]
    board.state[horizontal_axis][vertical_axis] = 1
  end




end
