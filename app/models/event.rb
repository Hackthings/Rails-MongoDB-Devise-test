class Event
  include Mongoid::Document
  field :name, type: String
  field :location, type: String
  field :time, type: Time
end
