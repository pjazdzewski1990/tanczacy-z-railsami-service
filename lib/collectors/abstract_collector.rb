# Base class for all collectors (shouldn't be instanced)
# It's purpose is to provide reference for required methods in collectors
class AbstractCollector
  # This method should retrieve resources for specified accounts and store them in DB
  # accounts - Array of accounts to fetch resources from
  # Should return collection of account which were successfully refreshed
  def collect(accounts)
    raise "Collect not implemented in #{self.class.name}"
  end 

  # This method should refresh all expired access tokens
  def refresh_tokens
    raise "Refresh tokens not implemented in #{self.class.name}"
  end 

  # It also provides some helper methods for all collectors

  attr_accessor :settings
  attr_accessor :logger

  # It allows to store some context data into database which 
  # will allow to continue work in exact same place during next "collect" 
  #
  # i.e. It could store uid of latest account retrieved
  def store_context(context)

  end

  def initialize(settings)
    @settings = settings
    @logger = settings[:logger] 
  end
  
  def save_resources(resources)
    resources.each do |resource|
      resource.save validate: false

      logger.info(
      'Resource: ' +
      resource.published.to_s +
      ' ' +
      resource.body.to_s)
    end
  end
end
