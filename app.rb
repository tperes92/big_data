require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

class Player
	@player1=Player.new("Josiane")
	@player2=Player.new("José")
#création de deux players

  while @player1.life_points > 0 && @player2.life_points > 0
	puts
	puts "Voici l'état de chaque joueur : "
	print @player1.show_state
	puts @player2.show_state
#niveau de vie
	puts "Passons à la phase d'attaque :" 
	@player1.attacks(@player2)
		if @player2.life_points <=0
			break
		end
	@player2.attacks(@player1)
  end
end

