get '/newanswer' do
	erb :"static/answers/new"

end


post '/newanswer' do 

	answer = Answer.create(a_text: params[:answer])

end