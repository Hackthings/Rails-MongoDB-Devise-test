class Blog::Blob
  include Mongoid::Document

  validates_presence_of :title
  validates_presence_of :body

  field :title, type: String
  field :body, type: String
end
