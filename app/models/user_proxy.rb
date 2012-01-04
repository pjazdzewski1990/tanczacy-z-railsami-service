class UserProxy < ActiveResource::Base
  include Mongoid::Document
  field :uid
  field :token
  field :refresh
  field :datetoken
  field :refresh
  field :datetoken
  field :refresh
  field :date
  belongs_to :service
end
