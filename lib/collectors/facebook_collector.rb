require 'abstract_collector.rb'

class FacebookCollector < AbstractCollector
  def collect(accounts)
    Rails.logger.info "Facebook collect invoked"

    accounts.each do |account|
      @fb.set_token account[:auth_token]
      # Get last status timestamp
      @last_status_date = 100.days.ago.to_s
      data = @fb.selection.me.statuses.since(@last_status_date).info!
      
      data.each do |r|
        if r[0] == 'data'
          save_resources(transform_statuses(r[1]))
        end
      end
    end
  end

  def initialize(settings)
    super(settings)
    @fb = FBGraph::Client.new(
      client_id: settings[:client_id],
      secret_id: settings[:secret]
    )
  end
 
  def refresh_tokens
    Rails.logger.info "Facebook doesn't require token refreshing"
  end 

  def transform_statuses(statuses)
    statuses.map do |status|
        { 
          content: status[:message],
          created_at: status[:updated_time],
          uid: status.from[:id]
        }
    end
  end
end
