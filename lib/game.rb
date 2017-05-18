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
    # fail 'Square not on board' unless horizontal_choice == (1 || 2 || 3)
    fail 'Square already taken' unless board.state[horizontal_choice][vertical_choice] == 0
    board.state[horizontal_choice][vertical_choice] = player
    switch_player
  end

  def switch_player
    player == 1 ? self.player = 2 : self.player = 1
  end

  def horizontal_win?
    row_1_win = board.state[0][0] == board.state[0][1] && board.state[0][1] == board.state[0][2]
    row_2_win = board.state[1][0] == board.state[1][1] && board.state[1][1] == board.state[1][2]
    row_3_win = board.state[2][0] == board.state[2][1] && board.state[2][1] == board.state[2][2]
    rows = [row_1_win, row_2_win, row_3_win]
    rows.each_with_index do |row, index|
      row_not_empty = board.state[index][0] != 0
      return true if row && row_not_empty
    end
    false
  end

  def vertical_win?
    column_1_win = board.state[0][0] == board.state[1][0] && board.state[1][0] == board.state[2][0]
    column_2_win = board.state[0][1] == board.state[1][1] && board.state[1][1] == board.state[2][1]
    column_3_win = board.state[0][2] == board.state[1][2] && board.state[1][2] == board.state[2][2]
    columns = [column_1_win, column_2_win, column_3_win]

    columns.each_with_index do |column, index|
      column_not_empty = board.state[0][index] != 0
      return true if column && column_not_empty
    end
    false
  end

  private

  attr_writer :player

end
