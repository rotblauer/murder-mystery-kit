json.array!(@evenings) do |evening|
  json.extract! evening, :id, :host_id, :game_id, :location, :caveat
  json.url evening_url(evening, format: :json)
end
