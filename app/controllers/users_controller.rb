post '/signup' do
  user = User.new(params[:user])
  # byebug
  if user.save
    # what should happen if the user is save?
    # @msg = "Welcome to Quora"
    redirect '/success'
  else
    # what should happen if the user keyed in invalid date?
    # @msg = "Invalid signup, please try again."
    redirect '/fail'
  end
end  

get '/users/:id/edit' do
  erb :"static/user/edit"
end

post '/users/:id/edit' do
  @user = User.find(params[:id])
  @user.update(first_name: params[:first_name], last_name: params[:last_name], username: params[:username], email: params[:email])
  redirect '/'
end
