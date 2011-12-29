# Base class for all collectors (shouldn't be instanced)
class AbstractCollector
  # It's purpose is to provide reference for required methods in collectors

  # This method should retrieve data and store it in DB
  def collect(collector_context)
    raise "Collect not implemented in #{self.class.name}"
  end 

  # This method should refresh all expired access tokens
  def refresh_tokens
    raise "Refresh tokens not implemented in #{self.class.name}"
  end 

  # It also provides some helper methods for all collectors

  # It allows to store some context data into database which 
  # will allow to continue work in exact same place during next "collect" 
  #
  # i.e. It could store uid of latest account retrieved
  def store_context(context)

  end
end
