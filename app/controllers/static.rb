# require '../models/user'
require 'byebug'

get '/' do

  erb :"static/signup"
end

get '/success' do
	erb :"static/success"
end

get '/fail' do
	erb :"static/fail"
end

