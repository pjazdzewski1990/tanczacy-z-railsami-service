require 'abstract_collector.rb'

require 'rubygems'
require 'httpclient'
require 'json'



class Plus

	attr_accessor :next

	def initialize(key, version)
		@key = key
		@version = version
	end

	def get_user(id)
		cl = HTTPClient.new
		return JSON.parse cl.get_content("https://www.googleapis.com/plus/"+ @version+"/people/"+id+"?key="+@key)
	end
	def get_posts(id )
		cl = HTTPClient.new
		result =  JSON.parse cl.get_content("https://www.googleapis.com/plus/"+ @version+"/people/"+id+"/activities/public?key="+@key)
		@next = result["nextPageToken"]
		return result
	end


	def get_posts(id,per_page)
		#id - id usera
		#per_page - ilość postów na stronę (od 1 do 100)
		cl = HTTPClient.new
		result =  JSON.parse cl.get_content("https://www.googleapis.com/plus/"+ @version+"/people/"+id+"/activities/public?maxResults="+per_page.to_s+"&key="+@key)
		@next = result["nextPageToken"]
		@per_page = per_page
		return result
	end

	def next_page(id)
		cl = HTTPClient.new
		result =  JSON.parse cl.get_content("https://www.googleapis.com/plus/"+ @version+"/people/"+id+"/activities/public?maxResults="    +@per_page.to_s+"&key="+@key+"&pageToken="+@next)
		@next = result["nextPageToken"]
		return result
	end



end


class GoogleplusCollector < AbstractCollector
  def collect(accounts)
    Rails.logger.info "GooglePlus collect invoked"

    accounts.each do |account|

      # Get last status timestamp
      latest_resource = account.
                        resources.
                        order([:published, 'DESC']).
                        first
      

      if(latest_resource.nil?)
        data = @googleplus.get_posts(account.uid,99)
        data["items"].each do |itm|
           save_resources(transform_statuses(itm))
		end

      else
        data = @googleplus.get_posts(account.uid,99)
		data["items"].each do |itm|
		   if(DateTime.parse(latest_resource.published) < DateTime.parse(itm["updated"]))
		     save_resources(transform_statuses(itm))
		   end
		end
      end

      
      
    end

    accounts
  end

  def initialize(settings)
    super(settings)
    @googleplus_service = Service.where(name: 'googleplus').first
    @googleplus = Plus.new("AIzaSyARpdDXXm_gJf20TRCGulR2qg7tW2ycaxI","v1")
  end
 
  def refresh_tokens
    Rails.logger.info "GooglePlus doesn't require token refreshing"
  end 

  def transform_statuses(status)
    user_proxy = nil

      resource = @googleplus_service.resources.new
      resource.body = status["title"]
      resource.uid = status["actor"]["id"]
      resource.post_id = status["url"]
	  resource.published = status["updated"]

      user_proxy ||= UserProxy.where(uid: resource.uid).first
      resource.user_proxy = user_proxy

      resource
  end

end
