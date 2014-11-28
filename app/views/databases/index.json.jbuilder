json.array!(@databases) do |database|
  json.extract! database, :id, :name, :address, :comment
  json.url database_url(database, format: :json)
end
