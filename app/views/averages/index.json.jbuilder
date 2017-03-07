json.array!(@averages) do |average|
  json.extract! average, :id
  json.url average_url(average, format: :json)
end
