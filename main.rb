require_relative 'Game'
###############################
# Main program 
###############################

#initialization
lv = 1
sc = 0
fin = false


puts ",---.                   ,-,-,-.        ,---.                "                
puts "|  -'  . . ,-. ,-. ,-.  `,| | |   ,-.  |  -'  ,-. ,-,-. ,-. "
puts "|  ,-' | | |-' `-. `-.    | ; | . |-'  |  ,-' ,-| | | | |-' "
puts "`---|  `-^ `-' `-' `-'    '   `-' `-'  `---|  `-^ ' ' ' `-' "
puts " ,-.|                                   ,-.|                "
puts " `-+'                                   `-+'                "

puts "Selamat datang! Tugas Anda adalah menebak semua kata yang akan ditampilkan dibawah!"
puts "Selamat bermain!"
puts "Petunjuk : untuk keluar dari permainan, ketik .keluar"

while (lv <= 3 && !fin)
    #create object (every level create new object)
    g = Game.new(lv, sc)
    max = 15
    puts "---------------Level #{lv} --------------"
    puts

    #begin the game
    while (max != 0 && !fin)
        #get random words from array
        idx = rand(0..max)
       
        kata = g.randomKata(idx)
        max = max-1
        puts "Coba tebak kata ini: #{kata}"

        #asking for answers
        print "Jawab >> "
        ans = gets.chomp
        
        if (ans == ".keluar")
            fin = true
        end

        while (!g.cekKata(ans,g.get_listofKata(idx)) && !fin)
            puts "SALAH! Silakan tebak lagi! Score Anda masih: #{g.get_score()}"
            puts "Coba tebak kata ini lagi: #{kata}"
            print "Jawab >> "
            ans = gets.chomp
            if (ans == ".keluar")
                fin = true
            end
        end #g.cekKata(ans, g.get_listofKata(idx)) == true

        #add score
        if (!fin)
            g.set_score=(g.get_score()+1)
            puts "BENAR! Score : #{g.get_score()}"
            #preventing same words appear
            g.delete_listofKata(idx)
        end

    end

    #end of level, move to next level
    if (!fin)
        puts "SELAMAT, ANDA NAIK LEVEL"
        lv = g.get_level() + 1
        sc = g.get_score()
    end
end

puts "PERMAINAN BERAKHIR!"
puts "Score : #{g.get_score}"
puts "Terimakasih"
puts "Game by: Ayu Rifanny M."