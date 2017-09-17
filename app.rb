require 'sinatra'
require 'bundler/setup'
require 'redis'

set :redis, Redis.new(url: ENV['REDIS_URL'])

get '/' do
  'Hello Sinatra'
end

get '/ink' do
  # redis = Redis.new(url: ENV['REDIS_URL'])
  settings.redis.incr("counter").to_s
end

get '/version' do
  ENV['HOSTNAME']
end