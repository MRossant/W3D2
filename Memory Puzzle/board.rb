require_relative "card.rb"

class Board

    def initialize(row, col)
        @size = row * col
        if @size.even?
            @board = Array.new(row) {Array.new(col," ")}
            @cards = Array.new
        else
            raise "Incorrect dimensions, row * col must be even"
        end
    end

    def create_cards
        card_num = @size / 2 
        card_num.times do
            @cards << Card.new
        end
    end

    def populate
        

    end
end