json.array!(@landmasters) do |landmaster|
  json.extract! landmaster, :id
  json.url landmaster_url(landmaster, format: :json)
end
