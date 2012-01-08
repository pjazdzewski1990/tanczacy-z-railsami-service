class UserProxy 
  include Mongoid::Document

  field :uid, type: 'String'
  field :token, type: 'String'
  field :token_expires_at, type: 'DateTime'
  field :refresh_token, type: 'String'
  field :refresh_date, type: 'DateTime'

  belongs_to :service
  has_many :resources
end
