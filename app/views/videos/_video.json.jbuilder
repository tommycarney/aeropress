json.extract! video, :id, :url, :embed_code, :recipes_id, :created_at, :updated_at
json.url video_url(video, format: :json)