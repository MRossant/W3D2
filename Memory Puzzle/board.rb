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
            card_1 = Card.new
            card_2 = Card.new(card_1.face_value)
            @cards.push(card_1,card_2)
        end
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
                @board[i_r][i_c] = @cards[i]
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
                if el.card_up
                    print "#{el.face_value} "
                else
                    print "  "
                end
            end
        end
    end

    def won?
        @cards.all? {|card| card.card_up == true }
    end
    
    def reveal
        puts "Enter row,column index: 'r c'"
        response = gets.chomp.split.map(&:to_i)
        unless self[response].card_up
            self[response].reveal
        end
        self[response].face_value
    end

    def [](position)
        row, col = position
        @board[row][col]
    end

    def []=(position, face_value)
        row, col = position
        @board[row][col] = face_value
    end
end