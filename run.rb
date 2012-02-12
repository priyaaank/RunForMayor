require 'httparty'
require 'ostruct'
require 'yaml'
Dir.foreach(".") {|file| require_relative file if file.include?(".rb") }

user   = User.new
venues = user.visited_venues
Skywrap.new(user, venues).teleport_and_checkin
