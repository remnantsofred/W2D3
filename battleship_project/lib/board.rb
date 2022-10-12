class Board
    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    def [](arr)
        @grid[arr[0]][arr[1]]
    end

    def []=(position, val)
        @grid[position[0]][position[1]] = val
    end

    def num_ships
        count = 0
        one_d = @grid.flatten
        one_d.each { |ele| count += 1 if ele == :S }
        count
    end

    def attack(position)
        if self[position] == :S 
            self[position] = :H
            p 'you sunk my battleship!'
            return true
        else
            self[position] = :X
            return false
        end
    end

    def place_random_ships
        num = @size / 4
        while self.num_ships < num
            random_position = [rand(0..@grid.length-1), rand(0..@grid.length-1)]
            self[random_position] = :S
        end
    end

    def hidden_ships_grid
        hidden_grid = @grid.map do |subarr|
            subarr.map do |ele|
                if ele == :S 
                    :N 
                else
                    ele
                end
            end
        end
        hidden_grid
    end

    def self.print_grid(arr)
        arr.each do |subarr|
            puts subarr.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end
    
    def print
        Board.print_grid(hidden_ships_grid)
    end

end

