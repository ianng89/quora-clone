enable :sessions
get '/login' do
	erb :"static/login"
end

post '/login' do 
	# user = User.find_by_email(params[:email])



  #   redirect '/success'
	if user = User.authenticate(params[:email], params[:password]) 
		session['email'] ||= params[:email]
	  session['user_id'] ||= user.id
	  session['username'] ||= user.username
		redirect '/success' 
	else 
 

	    redirect '/fail'
  	end


end

get '/sessionyes' do 
	user = User.find_by_email(session[:email])

	if user 
		"success"
	else redirect '/'
	end
end


post '/logout' do
	session['email'] = nil 
	session['user_id'] = nil
redirect '/'
end

get '/users/:id' do
	end