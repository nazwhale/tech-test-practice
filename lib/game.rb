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
    fail 'Square already taken' unless board.state[horizontal_axis][vertical_axis] == 0
    board.state[horizontal_axis][vertical_axis] = player
    switch_player
  end

  def switch_player
    player == 1 ? self.player = 2 : self.player = 1
  end

  private

  attr_writer :player

end
