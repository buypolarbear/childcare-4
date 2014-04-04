json.array!(@calenders) do |calender|
  json.extract! calender, 
  json.url calender_url(calender, format: :json)
end