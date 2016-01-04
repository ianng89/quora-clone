# require '../models/user'
require 'byebug'

get '/' do

  erb :"static/index"
end

get '/success' do
	erb :"static/success"
end

get '/fail' do
	erb :"static/fail"
end

get '/signup' do
	erb :"static/signup"
end
