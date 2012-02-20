require 'httparty'
require 'ostruct'
require 'yaml'
require 'mongoid'
require 'sinatra'
Dir["models/**/*.rb"].sort.each {|file| require_relative file if (file.include?(".rb") and file != 'run.rb') }
Mongoid.load!("./config/mongoid.yml")

get '/' do
  "Dragons be here!"
end

get "/autocheckin/#{AccessConfig.new.webhook_secret}" do
    user = User.new
    venues = user.visited_venues
    Skywrap.new(user, venues).teleport_and_checkin
    "Shine on!"
end
