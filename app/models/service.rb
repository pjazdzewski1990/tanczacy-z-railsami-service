class Service < ActiveResource::Base
  include Mongoid::Document
  field :name
  field :website
  field :priority
  field :interval
  has_many :resources
end
