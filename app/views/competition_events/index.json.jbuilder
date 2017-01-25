json.array!(@competition_events) do |competition_event|
  json.extract! competition_event, :id, :name, :competition_id, :num_competitors
  json.url competition_event_url(competition_event, format: :json)
end
