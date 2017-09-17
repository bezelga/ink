require 'sinatra'
require 'bundler/setup'
require 'redis'

get '/' do
  'Hello Sinatra'
end

get '/ink' do
  redis = Redis.new(url: ENV['REDIS_URL'])
  redis.incr("counter").to_s
end