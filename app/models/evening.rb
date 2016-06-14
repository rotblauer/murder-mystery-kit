class Evening < ApplicationRecord

	# => evening.host
  belongs_to :host

  # => evening.game
  belongs_to :game

  # => evening.guests
  has_many :guests, dependent: :destroy

  # => evening.guest_characters
  has_many :guest_characters, dependent: :destroy
  
end
