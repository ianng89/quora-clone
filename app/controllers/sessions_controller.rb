enable :sessions

get '/login' do
	erb :"static/login"
end

post '/login' do 
	user = User.find_by_email(params[:email])

  if user.password == params[:password]
  #   give_token
  # else
  session['email'] ||= params[:email]
  session['name'] ||= params[:first_name]

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

redirect '/'
end