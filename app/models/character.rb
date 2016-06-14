class Character < ApplicationRecord
  
  # =>  character.game
  belongs_to :game

  # => character.guests
  has_many :guest_characters, dependent: :destroy # (will set by evening)

  # =>  character.guests
  has_many :guests, through: :guest_characters

  # => character.event_characters
  has_many :event_characters, dependent: :destroy

  # => character.events
  has_many :events, through: :event_characters

end
