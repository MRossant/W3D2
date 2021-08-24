require_relative "card.rb"

class Board

    def initialize(size)
        @board = Array.new(size) {Array.new(size," ")}
        @size = size
        @card = Car.new()
    end
end