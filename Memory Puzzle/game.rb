require_relative "board.rb"
require_relative "card.rb"

class Game

    attr_reader :board

    def get_position
        puts "Yo, enter the row, col size"
        position = gets.chomp.split.map(&:to_i)
    end

    def initialize
        @size = self.get_position
        @board = Board.new(@size[0], @size[1])
        @board.populate
    end

    def play
        @board.render
        sleep(5)
        system("clear")
        @board.hide_all_cards
        @board.render

        until @board.won?
            


        end

    end

end