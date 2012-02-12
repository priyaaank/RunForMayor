require './skywrap'
require './user'
require './venue_list'

user   = User.new
venues = user.visited_venues
Skywrap.new(user, venues).teleport_and_checkin
