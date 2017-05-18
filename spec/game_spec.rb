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
    context 'move #1' do
      before do
        game.update_board([0,2])
      end

      it 'updates the board with the players move' do
        expect(game.board.state).to eq [[0,0,1],[0,0,0],[0,0,0]]
      end

      it 'doesnt update if square is already taken' do
        expect{ game.update_board([0,2]) }.to raise_error 'Square already taken'
      end

      it 'doesnt update if square is not on the board' do
        expect{ game.update_board([0,3]) }.to raise_error 'Square not on board'
      end

      it 'switches the player number at the end of a move' do
        expect(game.player).to eq 2
      end
    end

    context 'move #2' do
      before do
        game.update_board([0,2])
        game.update_board([0,1])
      end

      it 'switches the back to the first player after 2 moves' do
        expect(game.player).to eq 1
      end

      it 'updates the board with a 2 when player is 2' do
        expect(game.board.state).to eq [[0,2,1],[0,0,0],[0,0,0]]
      end
    end

    describe '#horizontal_win' do

      context 'false' do
        before do
          game.update_board([0,2])
          game.update_board([0,1])
        end

        it 'when horizontal row is filled with 1s and 2s' do
          game.update_board([0,0])
          expect(game.horizontal_win?).to be_falsy
        end
      end

      context 'true' do
        it 'p1 top row horizontal_win' do
          game.update_board([0,2])
          game.update_board([1,2])
          game.update_board([0,1])
          game.update_board([1,1])
          game.update_board([0,0])
          expect(game.horizontal_win?).to be_truthy
        end

        it 'p2 middle row horizontal_win' do
          game.update_board([0,2])
          game.update_board([1,2])
          game.update_board([0,1])
          game.update_board([1,1])
          game.update_board([2,2])
          game.update_board([1,0])
          expect(game.horizontal_win?).to be_truthy
        end

        it 'p1 bottom row horizontal_win' do
          game.update_board([2,2])
          game.update_board([1,2])
          game.update_board([2,1])
          game.update_board([1,1])
          game.update_board([2,0])
          expect(game.horizontal_win?).to be_truthy
        end
      end
    end

    describe '#vertical_win' do

      context 'true' do
        it 'p1 left column vertical win' do
          game.update_board([0,0])
          game.update_board([1,1])
          game.update_board([1,0])
          game.update_board([1,2])
          game.update_board([2,0])
          expect(game.vertical_win?).to be_truthy
        end

        it 'middle column vertical win' do
          game.update_board([0,1])
          game.update_board([0,0])
          game.update_board([1,1])
          game.update_board([2,2])
          game.update_board([2,1])
          expect(game.vertical_win?).to be_truthy
        end

        it 'right column vertical win' do
          game.update_board([0,2])
          game.update_board([0,0])
          game.update_board([1,2])
          game.update_board([2,0])
          game.update_board([2,2])
          expect(game.vertical_win?).to be_truthy
        end
      end
    end




  end
end
