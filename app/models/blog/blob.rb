class Blog::Blob
  include Mongoid::Document

  validates_presence_of :title

  field :title, type: String
  field :body, type: String
end
