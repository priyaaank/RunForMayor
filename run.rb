require 'httparty'
require 'ostruct'
require 'yaml'
require 'mongoid'
ENV["RACK_ENV"] ||= "development"
Mongoid.load!("./config/mongoid.yml")
Dir.foreach(".") {|file| require_relative file if (file.include?(".rb") and file != 'run.rb') }

user   = User.new
venues = user.visited_venues
# Skywrap.new(user, venues).teleport_and_checkin
