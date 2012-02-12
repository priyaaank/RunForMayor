require 'httparty'
require 'ostruct'
require 'yaml'
Dir.foreach(".") {|file| require_relative file if file.include?(".rb") }

user   = User.new
venues = user.visited_venues
puts venues.map(&:name)
puts venues.map(&:been_here_times)
# Skywrap.new(user, venues).teleport_and_checkin
