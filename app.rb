require 'sinatra'
require 'redis'
require 'bundler/setup'

set :redis, Redis.new(url: ENV['REDIS_URL'])

get '/' do
  'hello ray charles' 
end

get '/ink' do
  settings.redis.incr("counter").to_s
end

get '/version' do
  ENV['HOSTNAME']
end