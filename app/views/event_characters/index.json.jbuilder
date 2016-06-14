json.array!(@event_characters) do |event_character|
  json.extract! event_character, :id, :event_id, :character_id, :index
  json.url event_character_url(event_character, format: :json)
end
