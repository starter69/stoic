json.array!(@meditations) do |meditation|
  json.extract! meditation, :id, :title, :passage
  json.url meditation_url(meditation, format: :json)
end
