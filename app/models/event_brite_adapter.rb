require 'uri'
require 'net/http'
require_relative 'event'

class EventBriteAdapter
  attr_reader :url

  def initialize
    @api_key = ENV['42KTSFIVYR6ATL3HK4IL']
    @url = URI("https://www.eventbriteapi.com/v3/users/me/owned_events/?token=#{ENV["EVENTBRITE_PERSONAL_OAUTH_TOKEN"]}")
  end

  def return_events
    http = Net::HTTP.new(@url.host, @url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(@url)
    # request["cache-control"] = 'no-cache'
    # request["postman-token"] = '360098b1-ac77-834a-589a-47373822397e'

    response = http.request(request)
    JSON.parse(response.read_body)["events"].map {|event| Event.new(event)}
  end

end
