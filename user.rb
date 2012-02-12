require './access_config'
require './venue_list'

class User

  attr_accessor :id, :token

  def initialize(id = '8601518', oauth_token = AccessConfig.new.access_token)
    @id                 = id
    @token              = oauth_token
    @visited_venue_list = VenueList.new(self)
  end

  def visited_venues
    @visited_venue_list.all
  end

end

User.new.visited_venues.each do |venue|
  puts "#{venue.name} :: #{venue.id}"
end
