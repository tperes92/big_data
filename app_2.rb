require 'bundler'
Bundler.require

require_relative 'lib/game' 
require_relative 'lib/player'
 
 puts " -------------------------------------"
 puts"|           WELCOME IN THE AERA        |"
 puts " -------------------------------------"


class HumanPlayer
	puts "What's your name, soldier ?"
	name=gets.chomp
	user=HumanPlayer.new("#{name}")
	
	enemies = []	#création d'un array. Utile pour la suite lorsqu'il y aura bcp de joueurs.
	player1=Player.new("Josiane")
	player2=Player.new("José")
	enemies << player1 << player2 # chaque joueur rentre dans le tableau

	puts "Quelle action veux-tu effectuer ?
	
	a - chercher une meilleure arme
	s - chercher à se soigner
	
	attaquer un joueur en vue :
	0 - Josiane a #{player1.life_points} points de vie
	1 - José a #{player2.life_points} points de vie"

	while user.life_points > 0 && (player2.life_points >0 || player1.life_points >0) #on rentre dns la boucle. Tant qu'un joueur n'a pas 0 de vie, la boucle recommence.

		case gets.strip #selon l'action choisie, on s'orient vers un des when.
			when "a"
				user.search_weapon
			when "s"
				user.search_health_pack
			when "0" 
				user.attacks(player1)
					if player1.life_points <=0
						break
					end
			when "1"
				puts "Passons à la phase d'attaque :" 
				user.attacks(player2)
					if player2.life_points <=0
						break
					end
		end #une fois le when choisie, les enemies attaquent
		puts "Les autres joueurs t'attaquent "	
		enemies.each {|enemie| enemie.attacks(user)}
			if user.life_points <=0 #tant que je ne suis pas mort, la boucle recommence.
				break
			end	
		user.show_state #mon niveau de vie
		#on relance le menu
		puts "Quelle action veux-tu effectuer ?
	
		a - chercher une meilleure arme
		s - chercher à se soigner
		
		attaquer un joueur en vue :
		0 - Josiane a #{player1.life_points} points de vie
		1 - José a #{player2.life_points} points de vie"
    end
    puts "La partie est finie"
    #bilan : qui a gagné ? Qui a perdu ?
	if user.life_points !=0
	puts "BRAVO TU AS GAGNE"
	else puts "Loser, tu es mort !"
	end
end

