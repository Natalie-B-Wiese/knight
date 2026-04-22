# frozen_string_literal: true

require_relative '../lib/knight'
describe 'Knight' do
  describe '#knight_moves' do
    context 'on short path' do
      start_point = [0, 0]
      goal_point = [1, 2]
      result = knight_moves(start_point, goal_point)

      it 'returns an array' do
        expect(result).to be_an(Array)
      end

      it 'returns an array of vertices' do
        expect(result[0]).to be_a(Vertex)
      end

      it '0th point x is the same as first parameter x' do
        expect(result[0].x).to eq(start_point[0])
      end
      it '0th point y is the same as first parameter y' do
        expect(result[0].y).to eq(start_point[1])
      end

      it 'last point x is the same as second parameter x' do
        expect(result[result.length - 1].x).to eq(goal_point[0])
      end

      it 'last point y is the same as second parameter y' do
        expect(result[result.length - 1].y).to eq(goal_point[1])
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

      xit 'returns an array' do
        expect(result).to be_an(Array)
      end

      xit 'returns an array of vertices' do
        expect(result[0]).to be_a(Vertex)
      end

      xit '0th point x is the same as first parameter x' do
        expect(result[0].x).to eq(start_point[0])
      end
      xit '0th point y is the same as first parameter y' do
        expect(result[0].y).to eq(start_point[1])
      end

      xit 'last point x is the same as second parameter x' do
        expect(result[result.length - 1].x).to eq(goal_point[0])
      end

      xit 'last point y is the same as second parameter y' do
        expect(result[result.length - 1].y).to eq(goal_point[1])
      end

      xit 'path length is correct' do
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

      xit 'returns an array' do
        expect(result).to be_an(Array)
      end

      xit 'returns an array of vertices' do
        expect(result[0]).to be_a(Vertex)
      end

      xit '0th point x is the same as first parameter x' do
        expect(result[0].x).to eq(start_point[0])
      end
      xit '0th point y is the same as first parameter y' do
        expect(result[0].y).to eq(start_point[1])
      end

      xit 'last point x is the same as second parameter x' do
        expect(result[result.length - 1].x).to eq(goal_point[0])
      end

      xit 'last point y is the same as second parameter y' do
        expect(result[result.length - 1].y).to eq(goal_point[1])
      end

      xit 'path length is correct' do
        expect(result.length).to eq(7)
      end
    end
  end
end
