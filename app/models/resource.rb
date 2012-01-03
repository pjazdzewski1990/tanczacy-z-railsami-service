class Resource 
  include Mongoid::Document


  field :title
  field :body
  field :link
  field :published

  belongs_to :userProxy
  belongs_to :service
end
