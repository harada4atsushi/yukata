json.array!(@women) do |woman|
  json.extract! woman, :id, :name, :area, :published
  json.url woman_url(woman, format: :json)
end
