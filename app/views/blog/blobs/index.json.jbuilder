json.array!(@blobs) do |blob|
  json.extract! blob, :title, :body
  json.url blog_blob_url(blob, format: :json)
end
