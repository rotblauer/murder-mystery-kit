json.array!(@characters) do |character|
  json.extract! character, :id, :game_id, :name, :backstory, :attire
  json.url character_url(character, format: :json)
end
