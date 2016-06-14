class Event < ApplicationRecord
  
	# => event.game
  belongs_to :game

  # => event.event_characters
  has_many :event_characters

  # => event.characters
  has_many :characters, through: :character_events

end
