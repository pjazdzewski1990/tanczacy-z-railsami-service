class UserProxy < ActiveResource::Base
  include Mongoid::Document
  belongs_to :service
end
