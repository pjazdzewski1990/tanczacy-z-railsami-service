class Resource 
  include Mongoid::Document

  field :title
  field :body
  field :link
  field :published, type: 'DateTime'
  field :uid

  belongs_to :user_proxy
  belongs_to :service
end
