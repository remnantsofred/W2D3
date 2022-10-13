class HumanPlayer
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        p "Player using #{@mark} - enter a position with coordinates separated with a space like `1 0`"
        move = gets.chomp
        position = move.split(" ")
        if position.length != 2 || "abcdefghijklmnopqrstuvwxyz".include?(position[0]) ||"abcdefghijklmnopqrstuvwxyz".include?(position[1])
            raise "error - format incompatible"
        end
        position.map! { |num| num.to_i }
    end
    

    
end

