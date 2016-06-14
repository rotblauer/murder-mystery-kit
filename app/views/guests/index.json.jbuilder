json.array!(@guests) do |guest|
  json.extract! guest, :id, :evening_id, :character_id, :name, :phone_number, :email
  json.url guest_url(guest, format: :json)
end
