json.array!(@themes) do |theme|
  json.extract! theme, :id, :woman_id, :theme_kbn
  json.url theme_url(theme, format: :json)
end
