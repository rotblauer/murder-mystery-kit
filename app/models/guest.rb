class Guest < ApplicationRecord
  
	# => guest.evening
  belongs_to :evening

  # => guest.guest_characters
  has_many :guest_characters, dependent: :destroy

  # => guest.characters (will set by evening)
  has_many :characters, through: :guest_characters


end
