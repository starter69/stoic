json.array!(@doctrines) do |doctrine|
  json.extract! doctrine, :id, :title, :explanation, :category
  json.url doctrine_url(doctrine, format: :json)
end
