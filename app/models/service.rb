class Service
  include Mongoid::Document
  field :name
  field :website
  field :priority
  field :interval
  has_many :resources
  has_many :user_proxies
end
