require 'board'

describe Board do

  let(:board) { described_class.new }

  describe '#initialize' do
    it 'has a 3,3 array of zeros' do
      expect(board.state).to eq [[0,0,0],[0,0,0],[0,0,0]]
    end
  end
end
