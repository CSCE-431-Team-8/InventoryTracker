json.extract! item, :id, :product_id, :name, :description, :organization, :location, :quantity_remaining, :quantity_total, :rentable, :price, :created_at, :updated_at
json.url item_url(item, format: :json)
