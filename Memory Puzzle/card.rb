class Card
  attr_reader :face_value, :card_up
  ALPHABET = ("A".."Z").to_a
  @@num_pairs = []

  def initialize
    #if face_value = alphabet sample
    #   check if face_value is not included num_pairs
    #       shovel face_value to num_pairs
    while @face_value == nil
      @face_value = ALPHABET.sample
      if !@@num_pairs.include?(@face_value)
        @@num_pairs << @face_value
      else
        
      end
    end
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
