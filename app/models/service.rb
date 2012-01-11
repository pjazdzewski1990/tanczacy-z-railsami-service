class Service
  include Mongoid::Document
  validates_uniqueness_of :name

  field :name, type: 'String'
  field :website, type: 'String'
  field :priority
  field :interval
  has_many :resources
  has_many :user_proxies

  def self.cached_services
    @services ||= Service.all
  end
  
  def self.cached_service_by_name(service_name)
    self.cached_services.each do |s|
      if(s.name == service_name)
        return s
      end
    end
    nil
  end

  def self.cached_service(service_id)
    self.cached_services.each do |s|
      if(s.id == service_id)
        return s
      end
    end
    nil
  end
  
end
