json.extract! rented_item, :id, :organization, :item_id, :user_renting, :age, :date_rented, :return_date, :time_rented, :max_rent_time, :created_at, :updated_at
json.url rented_item_url(rented_item, format: :json)
