############################################
# Class Kamus : read external file of words
############################################

class Kamus
    #open external file, make array of strings
    def self.read_file(filename)
        f = open filename
        list_kata = []
        f.each do |kata|
            list_kata.push(kata.chomp)
        end

        f.close
        return list_kata
    end
end
