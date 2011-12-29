require 'abstract_collector.rb'

class FacebookCollector < AbstractCollector
  def collect(collector_context)
    Rails.logger.info "Facebook collect invoked"
  end

  def refresh_tokens
    Rails.logger.info "Facebook doesn't require token refreshing"
  end 
end
