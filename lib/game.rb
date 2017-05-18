require_relative 'board'

class Game

  attr_reader :board, :player

  def initialize
    @board = Board.new
    @player = 1
  end


  def update_board(move)
    horizontal_choice = move[0]
    vertical_choice = move[1]
    fail 'Square already taken' unless board.state[horizontal_choice][vertical_choice] == 0
    board.state[horizontal_choice][vertical_choice] = player
    switch_player
  end

  def switch_player
    player == 1 ? self.player = 2 : self.player = 1
  end

  def win?
    return true if board.state[0][0] == board.state[0][1] && board.state[0][1] == board.state[0][2] && board.state[0][0] != 0
    return true if board.state[1][0] == board.state[1][1] && board.state[1][1] == board.state[1][2] && board.state[1][0] != 0
    return true if board.state[2][0] == board.state[2][1] && board.state[2][1] == board.state[2][2] && board.state[2][0] != 0
  end

  private

  attr_writer :player

end
