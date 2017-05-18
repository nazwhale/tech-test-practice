require 'game'

describe Game do

  let(:game) { described_class.new }

  describe '#initialize' do
    it 'Initializes with a new instance of board' do
      expect(game.board).to be_a Board
    end
  end
end
