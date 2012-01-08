class UserProxy 
  include Mongoid::Document
  validates_uniqueness_of :uid, scope: [ :service_id ]

  field :uid, type: 'String'
  field :token, type: 'String'
  field :token_expires_at, type: 'DateTime'
  field :refresh_token, type: 'String'
  field :refresh_date, type: 'DateTime'

  belongs_to :service
  has_many :resources
  
  def initialize(params = nil)
    if(!params.nil?)
      transform_parameters(params)
    end   
    super(params)
  end

  private

  # Handles transformation of extra parameters which
  # are received through ActiveResource API
  # into model fields
  #
  # i.e. It transforms service_name parameter into appropriate service_id
  def transform_parameters(params)
    if(!params[:service_name].nil?)
      service = Service.where(name: params[:service_name]).first
      params.delete(:service_name)

      params[:service_id] = service.id
    end 
  end

end
