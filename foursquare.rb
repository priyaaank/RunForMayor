require 'httparty'
require 'ostruct'
require './venue_list'

class Foursquare

  VERSION_DATE = "20120101"

  include HTTParty
  base_uri 'https://api.foursquare.com/v2'

  def self.venue_history user, options = {}
    url = "/users/#{user.id}/venuehistory?oauth_token=#{user.token}&v=#{VERSION_DATE}"
    url = append_options_to(url, options)
    hash = OpenStruct.new(get(url))
    hash.response["venues"] || {}
  end

  private

  def self.append_options_to url, options
    options.inject(url) {|u, (k,v)| u = u + "&#{k}=#{v}"; u}
  end

end
