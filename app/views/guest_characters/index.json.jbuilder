json.array!(@guest_characters) do |guest_character|
  json.extract! guest_character, :id, :guest_id, :character_id, :index
  json.url guest_character_url(guest_character, format: :json)
end
