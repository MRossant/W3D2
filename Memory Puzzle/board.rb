require_relative "card.rb"

class Board

    attr_reader :board,:size,:cards, :row, :col

    def initialize(row, col)
        @size = row * col
        if @size.even?
            @board = Array.new(row) {Array.new(col," ")}
            @cards = Array.new
            @row = row
            @col = col
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

    def render
        print "  "
        (0...@col).each do |col_i|
        print "#{col_i} "
        end
        @board.each_with_index do |row, r_i|
            puts
            print "#{r_i} "
            row.each_with_index do |el, c_i|
                print "#{el} "
            end
        end
    end
end