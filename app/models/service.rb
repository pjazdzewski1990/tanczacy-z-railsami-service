class Service < ActiveResource::Base
  include Mongoid::Document
  field :name, type: 'String'
  field :website, type: 'String'
  field :priority
  field :interval
  has_many :resources
  has_many :user_proxies
end
