require_relative "./Card.rb"
require_relative "./Game.rb"

class Board
    attr_reader :grid

    def initialize
        @grid = Array.new(5) { Array.new(5) }
        @grid.each_with_index do |row, row_index|
            row.each_with_index do |column, column_index|
                if row_index == 0 && column_index != 0
                    @grid[row_index][column_index] = column_index-1
                elsif column_index == 0 && row_index != 0
                    @grid[row_index][column_index] = row_index-1
                else
                    @grid[row_index][column_index] = " "
                end
            end
        end
    end

    def populate
        letters = ("A".."H").to_a
        card_positions = []
        letters.each do |char|
            position1 = position
            until !card_positions.include?(position1)
                position1 = position
            end
            card_positions << position1
            @grid[position1[0]][position1[1]] = Card.new(char)

            position2 = position
            until !card_positions.include?(position2)
                position2 = position
            end
            card_positions << position2
            @grid[position2[0]][position2[1]] = Card.new(char)
        end
        true
    end

    def position
        x = rand(1..4)
        y = rand(1..4)
        [x,y]
    end

    def render
        rendered_grid = @grid.map do |row|
            row.map do |ele|
                if ele.is_a?(Card)
                    if ele.face_up
                        ele.face_value
                    else
                        " "
                    end
                else
                    ele
                end
            end
        end

        rendered_grid.each { |subarr| puts subarr.join(" ") }
        true
    end

    def won?
        counter = 0
        @grid.each do |row|
            row.each do |ele|
                if ele.is_a?(Card)
                    if ele.face_up
                        counter += 1
                    end
                end
            end
        end
        counter == 16
    end

    def reveal_card(pos)
        x, y = pos[0]+1, pos[1]+1
        ele = @grid[x][y]
        if ele.is_a?(Card)
            if ele.face_up == false
                ele.reveal
            else
                puts "This card is already face-up."
            end 
        else
            puts "This is not a valid position."
        end
    end
end