json.array!(@projects) do |project|
  json.extract! project, :id, :name, :github
  json.url project_url(project, format: :json)
end
