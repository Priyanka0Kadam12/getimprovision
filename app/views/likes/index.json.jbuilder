json.array!(@likes) do |like|
  json.extract! like, :id, :count, :post_id
  json.url like_url(like, format: :json)
end
