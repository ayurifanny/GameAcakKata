require_relative 'Kamus'

##########################################################
# Class Game : attributes : level, score, array of string#
##########################################################

class Game
    #constructor
    def initialize (level, score)
        @score = score
        @level = level
        puts "ANDA BERADA PADA LEVEL #{level}"
        puts "SCORE ANDA: #{score}"
        @listofKata = Kamus.read_file("file/input#{level}.txt")
    end

    #getter
    def get_listofKata(i)
        @listofKata[i]
    end

    def get_score()
        @score
    end

    def get_level()
        @level
    end
    
    #setter
    def set_score=(score)
        @score = score
    end

    #randomize string character order
    def randomKata(i)
        randKata = get_listofKata(i).split("").shuffle.join
        return randKata
    end
    
    #return true if k1 and k2 equals/same to each other
    def cekKata(k1, k2)
        return k1 == k2
    end

    #deleting string in array of string
    def delete_listofKata(idx)
        @listofKata.delete_at(idx)
    end


end



