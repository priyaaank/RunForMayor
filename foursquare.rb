class Foursquare

  VERSION_DATE = "20120101"

  include HTTParty
  base_uri 'https://api.foursquare.com/v2'
  headers 'Content-Type' => 'application/x-www-form-urlencoded'

  def self.venue_history user, options = {}
    url = "/users/#{user.id}/venuehistory?oauth_token=#{user.token}&v=#{VERSION_DATE}"
    url = append_options_to(url, options)
    hash = OpenStruct.new(get(url))
    hash.response["venues"] || {}
  end

  def self.checkin_user_at user, venue
    url = "/checkins/add"
    options = {:body => { "venueId" => venue.id, "broadcast" => "public", 
                          "oauth_token" => user.token, "v" => VERSION_DATE}}
    resp = post(url, options)
    Error.new(resp).print_if_error("Checking in at #{venue.name}")
    Day.today.add_checkin Checkin.for_venue(venue)
  end

  private

  def self.append_options_to url, options
    options.inject(url) {|u, (k,v)| u = u + "&#{k}=#{v}"; u}
  end

end
