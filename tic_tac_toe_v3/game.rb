require_relative "./board.rb"
require_relative "./human_player.rb"

class Game

    def initialize(n, *player_mark)
        @players = []
        player_mark.each do |player_mark|
            @players << HumanPlayer.new(player_mark)
        end
        @board = Board.new(n)
        @num_players = player_mark.length
        @current_player = @players[0]
    end

    def switch_turn
        @players.rotate!
        @current_player = @players[0]
    end

    def play 
        while @board.empty_positions? 
            @board.print
            # @current_player.get_position
            @board.place_mark(@current_player.get_position, @current_player.mark)
            if @board.win?(@current_player.mark)
                @board.print
                puts "Victory! Player using #{@current_player.mark} won the game!"
                return
            else
                self.switch_turn
            end
        end
        return "It's a draw! No winner and game over"
    end

end

