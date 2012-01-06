# Singleton class used to manage collectors
class CollectorManager
  private_class_method :new 

  # This method should retrieve accounts which needs to be refreshed
  # for specified collector
  def get_accounts(collector, limit)
    service = Service.where(name: collector).first
    accounts = service.
               user_proxies.
               limit(limit).
               order([:refresh_date, 'ASC'])
  end

  # Fetches resources for specified collectors
  def collect(collectors)
    collectors.each do |collector_name|
      collector = @collectors[collector_name]
      accounts = get_accounts collector_name, collector.settings[:request_limit]
      success_accounts = collector.collect accounts
      failed_accounts_count = accounts.size - success_accounts.size

      if(failed_accounts_count > 0)
        Rails.logger.error "Failed to fetch resources from #{failed_accounts_count} accounts"
      end
    
      success_accounts.each do |a|
          a.refresh_date = DateTime.now
          a.save validate: false
      end
    end
  end

  def self.instance
    @instance ||= new
  end

  private
  def initialize
    load_collectors 
  end

  def load_collectors
    @collectors = Hash.new
    COLLECTORS_SETTINGS.each do |name, settings|
      collector = get_collector_class name
      @collectors[name] = collector.new settings 
    end
  end

  def get_collector_class(name)
    class_name = name.to_s + "_collector"
    class_name.camelize.constantize
  end
end

