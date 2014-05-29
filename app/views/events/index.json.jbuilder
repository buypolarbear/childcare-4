json.array!(@events) do |event|
  json.extract! event, :title, :description, :allDay, :start, :end, :url, :color, :textColor, :child_id, :type
  json.url event_url(event, format: :json)
end