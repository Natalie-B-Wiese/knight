# frozen_string_literal: true

require_relative '../lib/knight'
describe 'Knight' do
  describe 'knight_moves' do
    context 'on short path' do
      start_point = [0, 0]
      goal_point = [1, 2]

      result = knight_moves(start_point, goal_point)

      it 'returns an array' do
        expect(result).to be_an(Array)
      end

      it 'returns a 2D array' do
        expect(result[0]).to be_an(Array)
      end

      it '0th point is the same as first parameter' do
        expect(result[0]).to eq(start_point)
      end

      it 'last point is the same as second parameter' do
        expect(result[result.length - 1]).to eq(goal_point)
      end

      it 'path length is 2 on 1-move path' do
        expect(result.length).to eq(2)
      end
    end

    context 'on medium length path' do
      # knight_moves([0,0],[3,3]) may return [[0,0],[2,1],[3,3]] or [[0,0],[1,2],[3,3]]

      start_point = [0, 0]
      goal_point = [3, 3]

      result = knight_moves(start_point, goal_point)

      it 'returns an array' do
        expect(result).to be_an(Array)
      end

      it 'returns a 2D array' do
        expect(result[0]).to be_an(Array)
      end

      it '0th point is the same as first parameter' do
        expect(result[0]).to eq(start_point)
      end

      it 'last point is the same as second parameter' do
        expect(result[result.length - 1]).to eq(goal_point)
      end

      it 'path length is correct' do
        expect(result.length).to eq(3)
      end
    end

    context 'on long path' do
      # knight_moves([0,0],[7,7]) may return these or other:
      # [[0,0],[2,1],[4,2],[6,3],[4,4],[6,5],[7,7]]
      # [[0,0],[2,1],[4,2],[6,3],[7,5],[5,6],[7,7]]

      start_point = [0, 0]
      goal_point = [7, 7]

      result = knight_moves(start_point, goal_point)

      it 'returns an array' do
        expect(result).to be_an(Array)
      end

      it 'returns a 2D array' do
        expect(result[0]).to be_an(Array)
      end

      it '0th point is the same as first parameter' do
        expect(result[0]).to eq(start_point)
      end

      it 'last point is the same as second parameter' do
        expect(result[result.length - 1]).to eq(goal_point)
      end

      it 'path length is correct' do
        expect(result.length).to eq(7)
      end
    end
  end
end
