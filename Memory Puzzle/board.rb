require_relative "card.rb"

class Board

    attr_reader :board,:size,:cards
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
        @cards+=@cards
    end

    def shuffle_cards
        @cards = @cards.shuffle
    end

    def populate
        self.create_cards
        self.shuffle_cards
        i=0
        @board.each_with_index do |row,i_r|
            row.each_with_index do |ele,i_c|
                @board[i_r][i_c] = @cards[i].face_value
                i+=1
            end
        end
    end
end