json.extract! list, :id, :title, :position, :board_id, :created_at, :updated_at
json.url list_url(list, format: :json)