class Resource 
  include Mongoid::Document

  field :title, type: 'String'
  field :body, type: 'String'
  field :link, type: 'String'
  field :published, type: 'DateTime'
  field :uid, type: 'String'

  belongs_to :user_proxy
  belongs_to :service
end
