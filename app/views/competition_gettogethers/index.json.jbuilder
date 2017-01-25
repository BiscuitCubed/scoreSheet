json.array!(@competition_gettogethers) do |competition_gettogether|
  json.extract! competition_gettogether, :id
  json.url competition_gettogether_url(competition_gettogether, format: :json)
end
