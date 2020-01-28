require 'pry'

class Player
attr_accessor :name, :life_points
#ci-dessous les différentes méthode
	def initialize (name)
		@name=name.to_s
		@life_points=10
	end 

	def show_state
		puts "#{@name} a #{@life_points} points de vie"
	end

	def gets_damage(damage)
		@damage=damage.to_i
		@life_points=@life_points-@damage
		if @life_points <=0
			puts "le joueur #{@name} a été tué !"
		else
		end
	end

	def attacks(player)
		puts "le joueur #{@name} attaque le joueur #{player.name}"
		@damage = compute_damage.to_i
		puts "Il lui inflige #{@damage} points de vie"	
		player.gets_damage(@damage)
	end

	def compute_damage
		return rand(1..6)
	end
end
#nouvelle classe pour HumanPlayer, qui a un niveau d'arme en plus.
class HumanPlayer < Player
attr_accessor :weapon_level

	def initialize (name)
		super(name)
		@life_points=100 #il a une vie plus importante que les autres players.
		@weapon_level=1
	end

	def show_state
	puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
	end

	def compute_damage
		return rand(1..6) *@weapon_level
	end

	def search_weapon
		@new_weapon_level = rand(1..6)
		puts "Tu as trouvé une arme de niveau #{@new_weapon_level}"
		if @new_weapon_level <= @weapon_level
			puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
		else @weapon_level = @weapon_level + @new_weapon_level
			puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
		end
	end

	def search_health_pack
		@health_pack = rand(1..6)
		if @health_pack == 1
			puts "Tu n'as rien trouvé"
		elsif @health_pack >= 2 && @health_pack <= 5
			puts "Bravo, tu as trouvé un pack de +50 points de vie !"
			@life_points = @life_points + 50
		else @health_pack == 6
			puts "Waow, tu as trouvé un pack de +80 points de vie !"
			@life_points = @life_points + 80
		end
		if @life_points >100
			@life_points = 100
		else @life_points = 100
		end
	end

end

binding.pry

