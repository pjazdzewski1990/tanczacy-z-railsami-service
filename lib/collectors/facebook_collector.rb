require 'abstract_collector.rb'

class FacebookCollector < AbstractCollector
  def collect(accounts)
    logger.info "Facebook collect invoked"

    accounts.each do |account|
      @fb.set_token account[:token]

      # Get last status timestamp
      latest_resource = account.
                        resources.
                        order([:published, 'DESC']).
                        first

      if(latest_resource.nil?)
        @last_status_date = 9000.days.ago.to_s
      else
        @last_status_date = latest_resource.published.to_time.to_s
      end

      data = @fb.selection.me.statuses.since(@last_status_date).info!
      
      data.each do |r|
        if r[0] == 'data'
          save_resources(transform_statuses(r[1]))
        end
      end
    end

    accounts
  end

  def initialize(settings)
    super(settings)
    @fb_service = Service.where(name: 'facebook').first
    @fb = FBGraph::Client.new(
      client_id: settings[:client_id],
      secret_id: settings[:secret]
    )
  end
 
  def refresh_tokens
    logger.info "Facebook doesn't require token refreshing"
  end 

  def transform_statuses(statuses)
    user_proxy = nil

    statuses.map do |status|
      resource = @fb_service.resources.new
      resource.body = status[:message]
      resource.uid = status.from[:id]
      resource.published = status[:updated_time]

      user_proxy ||= UserProxy.where(uid: resource.uid).first
      resource.user_proxy = user_proxy

      resource
    end
  end
end
