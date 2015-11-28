json.array!(@reviews) do |review|
  json.extract! review, :id, :title, :description, :user_id
  json.url review_url(review, format: :json)
end
