class GuestCharacter < ApplicationRecord

	# => guest_character.evening
	belongs_to :evening

	# => guest_character.character
	belongs_to :character

	# =>  guest_character.guest
  belongs_to :guest

  scope :by_evening, -> (evening_id) { where(:evening_id => evening_id) }

end
