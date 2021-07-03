json.extract! track, :id, :title, :ord, :lyrics, :album_id, :band_id, :created_at, :updated_at
json.url track_url(track, format: :json)
