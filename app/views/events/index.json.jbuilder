json.array!(@events) do |event|
  json.extract! event, :id, :game_id, :title, :chronology
  json.url event_url(event, format: :json)
end
