class Stage
	def enter()
	puts "This stage is not configured. Sublass it and call enter()."
	exit(1)
	end
end

class Engine

	def initialize(stage_map)
		@stage_map = stage_map
	end
	
	def play()
		current_stage = @stage_map.first_stage()
		last_stage = @stage_map.next_stage('finished')
		
		while current_stage != last_stage
			next_stage_name = current_stage.enter()
			current_stage = @stage_map.next_stage(next_stage_name)
		end
		
		current_stage.enter()
	end
end

class Failure < Stage
	
	@@quips = [
	"Bad choice. Your universe blinks back into nothingness.",
	"As quickly as it formed, your universe disappears. Try again.",
	"Maybe you just weren't meant to be an omnipotent ruler. Your universe failed.",
	"That wasn't the best decision. Your universe is now a barren wasteland."
	]
	
	def enter ()
		puts @@quips[rand(0..(@@quips.length - 1))]
		exit(1)
	end
end

class Creation < Stage

	def enter()
		puts "This is UNIVERSE, a text-based adventure. Your choices will appear in CAPS."
		puts "Enter your choice into the terminal to continue to the next stage."
		puts "-" * 15
		puts "You suddenly become aware of your existence in the vast nothingness of space."
		puts "You realize that you can manipulate the empty space that surrounds you."
		puts "With a flick of your omnipotent finger, a planet forms before you."
		puts "You realize that you can smash elements together at random, or stack"
		puts "elements neatly together to form new objects in the Universe."
		puts "Do you choose CHAOS or ORDER?"
		print "> "
		
		choice = $stdin.gets.chomp
		
		if choice == "CHAOS"
			puts "Your world is a disorderly, dusty sphere, covered with deserts"
			puts "divided sharply by narrow, jagged streams. Storms swirl in the"
			puts "atmosphere, and temperatures vary widely from day to night."
			return 'chaos_animals'
			
		elsif choice == "ORDER"
			puts "Your world is an orderly, balanced planet, about half sea and half land."
			puts "The weather is temperate and should be ideal to support a wide variety"
			puts "of living things."
			return 'order_animals'
			
		else
			puts "Please try to enter your response again."
			return 'creation'
		end
	end
end

class ChaosAnimals < Stage

	def enter()
		puts "You now must choose what kind of life forms will fill your planet."
		puts "Do your choose PLANTS or ANIMALS?"
		print "> "
		
		choice = $stdin.gets.chomp
		
		if choice == "PLANTS"
			puts "Your dusty world is dotted with grey-green plant life."
			puts "Your planet is filled with ferns, cactus, and succulents."
			puts "These plants will live a long time with a small amount of water."
			return 'chaos_plants_disaster'
		
		elsif choice == "ANIMALS"
			puts "Your dusty world springs to life. It is now populated with"
			puts "small lizards, who seem to only eat other, smaller lizards."
			return 'chaos_animals_disaster'
		
		else
			puts "Please try to enter your response again."			
			return 'chaos_animals'
		end
	end
end

class OrderAnimals < Stage

	def enter()
		puts "You now must choose what kind of life forms will fill your planet."
		puts "Do your choose PLANTS or ANIMALS?"
		print "> "
		
		choice = $stdin.gets.chomp
		
		if choice == "PLANTS"
			puts "Your planet explodes with life, kelp forming in the seas while lush"
			puts "forests spring forth on the land. The environmental conditions are"
			puts "perfect for sustaining future life forms."
			return 'order_plants_disaster'
		
		elsif choice == "ANIMALS"
			puts "The seas and land spring to life. Fish swim in the seas, and small"
			puts "mammals cover the land."
			return 'order_animals_disaster'
		
		else
			puts "Please try to enter your response again."			
			return 'order_animals'
		end
	end
end
		
class ChaosPlantsDisaster < Stage

	def enter()
		puts "You're feeling grumpy and are looking for an outlet for your bad mood."
		puts "You decide to test out your godlike power with an old-fashioned"
		puts "natural disaster. Do you choose an ASTEROID or a FLOOD?"
		print "> "
		
		choice = $stdin.gets.chomp
		
		if choice == "ASTEROID"
			puts "Your planet is consumed with fire, killing all the life on it."
			return 'failure'
		
		elsif choice == "FLOOD"
			puts "Your planet fills with water, drowning all of the plants."
			return 'failure'
		
		else
			puts "Please try to enter your response again."			
			return 'chaos_plants_disaster'
		end
	end
end

class ChaosAnimalsDisaster < Stage

	def enter()
		puts "You're feeling grumpy and are looking for an outlet for your bad mood."
		puts "You decide to test out your godlike power with an old-fashioned"
		puts "natural disaster. Do you choose an ASTEROID or a FLOOD?"
		print "> "
		
		choice = $stdin.gets.chomp
		
		if choice == "ASTEROID"
			puts "Your planet is consumed with fire, killing most of the lizards. A few small"
			puts "mammals manage to survive by burrowing underground."
			puts "Your planet has sustained massive damage, but the life on it presses on."
			return 'finished'
		
		elsif choice == "FLOOD"
			puts "Your planet fills with water, drowning all of the creatures on the land."
			return 'failure'
		
		else
			puts "Please try to enter your response again."			
			return 'chaos_animals_disaster'
		end
	end
end

class OrderPlantsDisaster < Stage

	def enter()
		puts "You're feeling grumpy and are looking for an outlet for your bad mood."
		puts "You decide to test out your godlike power with an old-fashioned"
		puts "natural disaster. Do you choose an EARTHQUAKE or a FLOOD?"
		print "> "
		
		choice = $stdin.gets.chomp
		
		if choice == "EARTHQUAKE"
			puts "Earthquakes shake the ocean floor, opening up crevices which pour"
			puts "lava up through the crust. Soon, small islands have formed."
			puts "Your planet continues to thrive."
			return 'finished'
		
		elsif choice == "FLOOD"
			puts "Your planet fills with water, drowning all of the plants."
			return 'failure'
		
		else
			puts "Please try to enter your response again."			
			return 'order_plants_disaster'
		end
	end
end

class OrderAnimalsDisaster < Stage

	def enter()
		puts "You're feeling grumpy and are looking for an outlet for your bad mood."
		puts "You decide to test out your godlike power with an old-fashioned"
		puts "natural disaster. Do you choose an EARTHQUAKE or a FLOOD?"
		print "> "
		
		choice = $stdin.gets.chomp
		
		if choice == "EARTHQUAKE"
			puts "Earthquakes shake the ocean floor, opening up crevices which pour"
			puts "lava up through the crust. Soon, small islands have formed."
			puts "Though some land animals have perished, most of the life on the planet thrives."
			return 'finished'
		
		elsif choice == "FLOOD"
			puts "Your planet fills with water, drowning all of the creatures on the land."
			return 'failure'
		
		else
			puts "Please try to enter your response again."			
			return 'order_animals_disaster'
		end
	end
end

class Finished < Stage
	def enter()
		puts "You won! You'd be a great omnipotent being!"
	end
end

class Map
	@@stages = {
		'creation' => Creation.new(),
		'chaos_animals' => ChaosAnimals.new(),
		'order_animals' => OrderAnimals.new(),
		'chaos_plants_disaster' => ChaosPlantsDisaster.new(),
		'chaos_animals_disaster' => ChaosAnimalsDisaster.new(),
		'order_plants_disaster' => OrderPlantsDisaster.new(),
		'order_animals_disaster' => OrderAnimalsDisaster.new(),
		'failure' => Failure.new(),
		'finished' => Finished.new(),
		}
		
	def initialize(start_stage)
		@start_stage = start_stage
	end
		
	def next_stage(stage_name)
		val = @@stages[stage_name]
		return val
	end
		
	def first_stage()
		return next_stage(@start_stage)
	end
end

a_map = Map.new('creation')
a_game = Engine.new(a_map)
a_game.play()
		


		 		