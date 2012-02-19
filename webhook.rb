require 'httparty'
require 'ostruct'
require 'yaml'
require 'mongoid'
require 'sinatra'
Dir.foreach(".") {|file| require_relative file if (file.include?(".rb") and file != 'run.rb') }

get '/hi' do
  # "Dragons be here!"
  ENV["RACK_ENV"]
end
