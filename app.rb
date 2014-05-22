require 'sinatra'
require 'sinatra/partial'
require 'sinatra/reloader' if development?

#require 'redis' #db

configure do
  redisUri = ENV["REDISTOGO_URL"] || 'redis://localhost:6379'
  uri = URI.parse(redisUri) 
  $redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
end

get '/' do
  "hello from sinatra"
end