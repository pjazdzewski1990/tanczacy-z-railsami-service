class Resource < ActiveRecord::Base
  belongs_to :userProxy
  belongs_to :service
end
