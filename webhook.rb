require 'httparty'
require 'ostruct'
require 'yaml'
require 'mongoid'
require 'sinatra'
Dir["models/**/*.rb"].sort.each {|file| require_relative file if (file.include?(".rb") and file != 'run.rb') }
Mongoid.load!("./config/mongoid.yml")

get '/hi' do
  "Dragons be here!"
end

get '/autocheckin/:secret' do
  if AccessConfig.new.webhook_secret == params[:secret]
    puts User.new
    "Booya! you know this shitz man!"
  else
    "Move along buddy! There's nothing to see here"
  end
end
