class Game < ApplicationRecord

	# => game.evenings
	has_many :evenings, dependent: :destroy

	# => game.hosts
	has_many :hosts, through: :evenings

	# => game.characters
	has_many :characters, dependent: :destroy

  accepts_nested_attributes_for :characters,
	  allow_destroy: true,
	  reject_if: :all_blank

	# => game.events
	has_many :events


end
