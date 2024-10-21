json.extract! card, :id, :title, :description, :position, :list_id, :created_at, :updated_at
json.url card_url(card, format: :json)
