json.extract! collection_note, :id, :text, :user_id, :created_at, :updated_at
json.url collection_note_url(collection_note, format: :json)
