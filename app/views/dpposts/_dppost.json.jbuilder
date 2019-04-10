json.extract! dppost, :id, :title, :body, :created_at, :updated_at
json.url dppost_url(dppost, format: :json)
