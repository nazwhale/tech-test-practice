require 'game'

describe Game do

  let(:game) { described_class.new }

  describe '#initialize' do
    it 'has a new instance of board' do
      expect(game.board).to be_a Board
    end

    it 'player_no is 1' do
      expect(game.player).to eq 1
    end
  end

  describe '#update_board' do
    it 'updates the board with the players move' do
      move = [0,2]
      game.update_board(move)
      expect(game.board.state).to eq [[0,0,1],[0,0,0],[0,0,0]]
    end

    it 'doesnt update if square is already taken' do
      move = [0,2]
      game.update_board(move)
      expect{ game.update_board(move) }.to raise_error 'Square already taken'
    end
  end
end
