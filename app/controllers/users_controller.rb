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