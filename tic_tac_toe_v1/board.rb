
class Board 

    attr_reader :grid

    def initialize
        @grid = Array.new(3) {Array.new(3, "_")}
    end

    def valid?(position)
        position[0] < @grid.length && position[1] < @grid[0].length 
    end

    def empty?(position) 
        @grid[position[0]][position[1]] == "_"  
    end

    def place_mark(position, mark)
        if !valid?(position)
            raise 'eror - invalid position'
        elsif !empty?(position)
            raise 'error - position already marked'
        else
            @grid[position[0]][position[1]] = mark
        end 
    end

    def print
        @grid.each do |subarr|
            puts subarr.join(" ")
        end
    end

    def win_row?(mark)
        @grid.each_with_index do |row, i|
            count = 0
            row.each_with_index do |column, j|
                if @grid[i][j] == mark
                    count += 1
                end
            end
            return true if count == @grid.length   
        end
        false
    end

    def win_col?(mark) 
        j = 0
        while j < @grid.length
            count = 0
            @grid.each_with_index do |row, i|
                if @grid[i][j] == mark
                    count += 1
                end
            end
            return true if count == @grid.length
            j += 1
        end
        false
    end

 
    def win_diagonal?(mark)
        count_down = 0
        @grid.each_with_index do |row, i|
            if @grid[i][i] == mark
                count_down += 1
            end
        end
        
        count_up = 0
        @grid.each_with_index do |row, i|
            if @grid[i][(@grid.length-1)-i] == mark
                count_up += 1
            end
        end
        count_down == @grid.length || count_up == @grid.length
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        one_d_grid = @grid.flatten
        one_d_grid.each do |position|
            return true if position == "_"
        end
        false
    end

end

p test_board = Board.new   
p test_board.place_mark([1, 1], :X)   
p test_board.place_mark([0, 2], :O)   
p test_board.place_mark([2, 1], :X)   
p test_board.print
p test_board.win?(:X)           #false
p test_board.win?(:O)           #false

puts "--"

p test_board.place_mark([0, 1], :O)   
p test_board.place_mark([0, 0], :X)   
p test_board.place_mark([1, 2], :O)
p test_board.place_mark([2, 2], :X)
puts "--"
p test_board.print
puts "--"
p test_board.win_row?(:X)       #false     
p test_board.win_row?(:O)       #false   
p test_board.win_col?(:X)       #false
p test_board.win_col?(:O)        #false
p test_board.win_diagonal?(:O)  #false
puts "--"
p test_board.win_diagonal?(:O)  #true
p test_board.win?(:X)           #true
p test_board.win?(:O)           #false


p test_board.empty_positions?   #true


