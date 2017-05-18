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

    before do
      game.update_board([0,2])
    end

    it 'updates the board with the players move' do
      expect(game.board.state).to eq [[0,0,1],[0,0,0],[0,0,0]]
    end

    it 'doesnt update if square is already taken' do
      expect{ game.update_board([0,2]) }.to raise_error 'Square already taken'
    end

    it 'switches the player number at the end of a move' do
      expect(game.player).to eq 2
    end

    it 'switches the back to the first player after 2 moves' do
      game.update_board([1,2])
      expect(game.player).to eq 1
    end




  end
end
