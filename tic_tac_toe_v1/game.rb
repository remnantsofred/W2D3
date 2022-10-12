require_relative "./board.rb"
require_relative "./human_player.rb"

class Game

    def initialize(player1_mark, player2_mark)
        @player1 = HumanPlayer.new(player1_mark)
        @player2 = HumanPlayer.new(player2_mark)
        @board = Board.new
        @current_player = @player1
    end

    def switch_turn
        if @current_player == @player1
            @current_player = @player2
        else
            @current_player = @player1
        end
    end

    def play 
        while @board.empty_positions? 
            @board.print
            # @current_player.get_position
            @board.place_mark(@current_player.get_position, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts "Victory! Player using #{@current_player.mark} won the game!"
                return
            else
                self.switch_turn
            end
        end
        return "It's a draw! No winner and game over"
    end

end

# p daphne = HumanPlayer.new(":X")