require_relative "board.rb"
require_relative "card.rb"

class Game

    attr_reader :board, :previous_guess, :guessed_position

    def get_position
        puts "Yo, enter the row, col size"
        position = gets.chomp.split.map(&:to_i)
    end

    def initialize
        @size = self.get_position
        @board = Board.new(@size[0], @size[1])
        @board.populate
        @previous_guess = nil
        @guessed_position = nil
    end

    def play
        @board.render
        sleep(5)
        system("clear")
        @board.hide_all_cards
        until @board.won?
            system("clear")
            @board.render
            @previous_guess = @board.reveal_space
            system("clear")
            @board.render
            @guessed_position = @board.reveal_space
            if @previous_guess.face_value != @guessed_position.face_value
                sleep(2)
                @previous_guess.hide
                @guessed_position.hide
                @previous_guess = nil
                @guessed_position = nil
            end
        end
        
        @board.render
        puts "YOU WIN 🎉"
    end
end