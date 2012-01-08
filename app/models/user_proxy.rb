class UserProxy 
  include Mongoid::Document
<<<<<<< HEAD

  field :uid
  field :token
=======
  field :uid, type: 'String'
  field :token, type: 'String'
>>>>>>> ad8751a8b1167d1ff4e553d984f75e19ad4fb102
  field :token_expires_at, type: 'DateTime'
  field :refresh_token, type: 'String'
  field :refresh_date, type: 'DateTime'

  belongs_to :service
  has_many :resources
end
