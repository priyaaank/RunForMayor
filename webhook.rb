require 'httparty'
require 'ostruct'
require 'yaml'
require 'mongoid'
require 'sinatra'
Mongoid.load!("./config/mongoid.yml")
Dir.foreach(".") {|file| require_relative file if (file.include?(".rb") and file != 'run.rb') }

get '/hi' do
  "Dragons be here!"
end

get '/autocheckin/:secret' do
  if AccessConfig.webhook_sceret == params[:secret]
    "Booya! you know this shitz man!"
  else
    "Move along buddy! There's nothing to see here"
  end
end
