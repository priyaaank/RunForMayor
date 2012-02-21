require 'ostruct'
require 'yaml'
require 'mongoid'
require 'httparty'
Dir["models/**/*.rb"].sort.each {|file| require_relative "../#{file}" if (file.include?(".rb") and file != 'run.rb') }
