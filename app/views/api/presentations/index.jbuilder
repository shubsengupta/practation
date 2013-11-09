json.array! @presentations do |json,presentation|
  json.id presentation.id
  json.name presentation.name
  json.type presentation.type
end