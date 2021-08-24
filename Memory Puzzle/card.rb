class Card

    attr_reader :face_value, :card_up

    def initialize(face_value, card_up)
        @face_value = face_value
        @card_up = true
    end

    def hide
        @card_up = false
    end

    def reveal?
        @card_up = true
    end

    def to_s
        @face_value.to_s
    end

    def ==(other_card)
        @face_value == other_card.face_value
    end
end