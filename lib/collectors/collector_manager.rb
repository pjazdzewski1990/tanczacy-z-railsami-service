# Singleton class used to manage collectors
class CollectorManager
  private_class_method :new 
  attr_reader :logger

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
    logger.info("[ " + Time.now.to_s + " ]" + " Collect task invoked")
    collectors.each do |collector_name|
      begin
        collector = @collectors[collector_name]
        accounts = get_accounts collector_name, collector.settings[:request_limit]
        success_accounts = collector.collect accounts
        failed_accounts_count = accounts.size - success_accounts.size

        if(failed_accounts_count > 0)
          logger.error "Failed to fetch resources from #{failed_accounts_count} accounts"
        end
    
        success_accounts.each do |a|
          a.refresh_date = DateTime.now
          a.save validate: false
        end
      rescue => e
        logger.error "Exception occured during #{collector_name} collecting task: #{e.message}\n" +
        e.backtrace.to_s
      end
    end
  end

  def self.instance
    @instance ||= new
  end

  private
  def initialize
    @logger = Logger.new(COLLECTORS_SETTINGS[:log_file])
    load_collectors 
  end

  def load_collectors
    @collectors = Hash.new
    COLLECTORS_SETTINGS[:collectors].each do |name, settings|
      settings.merge!(logger: logger)
      begin
        collector = get_collector_class name
        @collectors[name] = collector.new settings 
      rescue NameError
        logger.error "Missing #{get_collector_class_name name} collector class"
      rescue => e
        logger.error "Exception occured during initialization of #{collector.to_s} collector: #{e.message}"
      end
    end
  end

  def get_collector_class(name)
    get_collector_class_name(name).constantize
  end

  def get_collector_class_name(name)
    (name.to_s + "_collector").camelize
  end
end

