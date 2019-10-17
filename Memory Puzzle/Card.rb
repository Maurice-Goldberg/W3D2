require_relative "./Board.rb"
require_relative "./Game.rb"

class Card
    attr_reader :face_up, :face_value

    def initialize(face_value)
        @face_up = false
        @face_value = face_value
    end

    def hide
        @face_up = false
        true
    end

    def reveal
        @face_up = true
        @face_value.to_s
    end

    def ask_value
        @face_up ? @face_value : (puts "this card is face down")
    end

    def to_s
        @face_value.to_s
    end

    def ==(card_instance)
        self.face_value == card_instance.face_value
    end
end