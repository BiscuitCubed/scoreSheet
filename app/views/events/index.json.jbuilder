json.array!(@events) do |event|
  json.extract! event, :id, :name, :competition_id, :num_competitors
  json.url event_url(event, format: :json)
end
