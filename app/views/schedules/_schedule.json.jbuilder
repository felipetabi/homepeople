json.extract! schedule, :id, :date_time, :price, :is_closed, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)
