get '/questions/:id/answer' do
	@question = Question.find(params[:id])
	erb :"static/answers/new"

end


post '/questions/:id/answer' do 
	question = Question.find(params[:id])
	# answer = Answer.create(a_text: params[:answer], question_id: question.id , user_id: session[:user_id])
	
	answer = question.answers.create(a_text: params[:answer], user_id: session[:user_id])

	if answer.save
	redirect '/questions'
	else
	redirect '/fail'
	end

end