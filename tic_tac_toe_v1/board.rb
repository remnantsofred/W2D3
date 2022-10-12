
class Board 

    def initialize
        @grid = Array.new(3) {Array.new(3, "_")}
    end

    def valid?(position)
        position[0] < @grid.length - 1 && position[1] < @grid[0].length - 1
    end


end

p test = Board.new
p test.valid?([4, 1])