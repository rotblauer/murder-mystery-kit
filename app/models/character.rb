class Character < ApplicationRecord
  
  # =>  character.game
  belongs_to :game

  # => character.guests
  has_many :guest_characters # (will set by evening)

  # =>  character.guests
  has_many :guests, through: :guest_characters

  # => character.event_characters
  has_many :event_characters

  # => character.events
  has_many :events, through: :event_characters

end
