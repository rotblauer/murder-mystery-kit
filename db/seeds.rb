# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#   

# How many friends do you have?
# 1:1 :: Characters:Guests
PARTY_SIZE = 5

# Create a host. 
# Host is like User. They must register/sign in with email and password. So authentication will be required to host games, but not to be a Guest.
host = Host.create({name: Faker::StarWars.character, email: 'murder@mystery.kit', password: 'asdfasdf', password_confirmation: 'asdfasdf'})

# Create games.
# 
# The game of the evening.
tonights_game = Game.create({
		name: 'Scarlet O\'Scarya is at it again.',
		backstory: 'A russian mistress with a passion for passion becomes entagled with a forgetful groundskeeper in Norway.'
	})
another_random_game = Game.create({
		name: 'A Night at the Zoo', 
		backstory: 'Whoo done it?'
	})

# Create some special characters for tonight's game. 
# See how it's creating multiple records at once with an Array?
tonights_game.characters.create([
	{
		name: 'Fraulein Spizz',
		backstory: 'From a long long way away...',
		attire: 'Red hat, white gloves, hot temper.'
	},
	{
		name: 'Herr Spiegelbald',
		backstory: 'An trusty crook caught in double jeapordy.',
		attire: 'Ivory cane and a pet mouse.'
	}
])
# add 3 more random characters to tonight's game so we have matching number of guests and characters. 
(PARTY_SIZE - 2).times do |t|
	tonights_game.characters.create({
		name: Faker::Superhero.name,
		backstory: Faker::Lorem.sentence,
		attire: Faker::Commerce.product_name
		})
end

# create more characters for second game for mass appeal
4.times do |t|
	another_random_game.characters.create({
		name: Faker::Name.name,
		backstory: Faker::Lorem.sentence,
		attire: Faker::Lorem.sentence
		})
end

# Create events for first game.
# Hans Solo smashes the chandelier with a hockey stick on accident.
game_events = 8.times do |t|

	accidental_chandelier_smashing = tonights_game.events.create({
		title: Faker::StarWars.quote,
		chronology: t
		})

	# involve a random (>=0) number of characters in each event
	# rand => 0.2345342, ie random 0-1 float
	# ceil => rounds up to nearest Integer
	(rand * (PARTY_SIZE)).ceil.times do |t|
		# using index here to assign characters isn't the most elegant because the first n characters get to have all the fun
		# same(ish) problem is below for guests
		accidental_chandelier_smashing.event_characters.create(character_id: tonights_game.characters.to_a[t].id)
	end
end

# Let's party. 

# Create an evening with our first game for our skywalking host.
evening = host.evenings.create({
	game_id: tonights_game.id,
	location: Faker::Address.street_address,
	caveat: Faker::Hipster.sentence
	})

# Invite some friends to our special evening.
PARTY_SIZE.times do |t|
	
	# Guests' name as var to make available for reuse in email.
	name = Faker::Name.name
	
	evening.guests.create({
		name: name,
		phone_number: Faker::PhoneNumber.cell_phone,
		 # Use just first name for email.
		 # String.split('x') => Array delimited by x
		 # [0] => first object in array, ie first name
		email: Faker::Internet.free_email(name.split(' ')[0])
		})
end

# Assign each of our guests to characters in the game.
evening.guests.each_with_index do |guest, index|
	guest.guest_characters.create({
		evening_id: evening.id,
		# inelegance is matching guests to characters by index (order), instead of randomness
		character_id: tonights_game.characters.all.to_a[index].id 
		})
end

