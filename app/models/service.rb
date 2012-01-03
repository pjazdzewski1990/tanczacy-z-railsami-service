class Service < ActiveResource::Base
  include Mongoid::Document
  has_many :resources
end
