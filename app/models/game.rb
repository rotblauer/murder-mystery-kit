class Game < ApplicationRecord

	# => game.evenings
	has_many :evenings

	# => game.hosts
	has_many :hosts, through: :evenings

	# => game.characters
	has_many :characters

	# => game.events
	has_many :events


end
