json.array!(@solves) do |solve|
  json.extract! solve, :id, :competitor_id, :event_id
  json.url solve_url(solve, format: :json)
end
