class Resource 
  include Mongoid::Document

  field :title, type: 'String'
  field :body, type: 'String'
  field :link, type: 'String'
  field :published, type: 'DateTime'
  field :uid, type: 'String'
  field :post_id, type: 'String'
  belongs_to :user_proxy
  belongs_to :service

  def self.query(params)
    query = Resource.all
    if(!params.nil?)
      params.each do |c|
        query = query.or(self.param_to_condition c)
      end
    end
    query
  end

  def as_json(options)
    {
      body: body,
      link: link,
      published: published,
      uid: uid,
      post_id: post_id,
      service_name: service.name 
    }
  end

  # Transforms parameters passed through ActiveResource
  # into valid mongo condition
  def self.param_to_condition(param)
    service = Service.where(name: param['service_name']).first
    condition = [uid: param['uid'].to_s, service_id: service.id]
    if(!param['start_date'].nil?)
      condition[0].merge!( :published.gt => Time.parse(param['start_date']))
    end

    condition
  end
end
