class UserProxy < ActiveResource::Base
  include Mongoid::Document
  field :uid
  field :token
  field :token_expires_at, type: 'DateTime'
  field :refresh_token
  field :refresh_date, type: 'DateTime'

  belongs_to :service
  has_many :resources
end
