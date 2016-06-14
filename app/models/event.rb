class Event < ApplicationRecord
  
	# => event.game
  belongs_to :game

  # => event.event_characters
  has_many :event_characters, dependent: :destroy

  # => event.characters
  has_many :characters, through: :event_characters

end
