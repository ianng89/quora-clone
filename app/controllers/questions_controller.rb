

get '/newquestion' do 

erb :"static/questions/new"
	
end

post '/newquestion' do

question = Question.create(q_text: params[:question], user_id: session[:user_id] )

	if question.save

		redirect '/'
	else

		redirect '/fail'
	end
end

get '/questions' do
	@questions = Question.all.order(:id)
	erb :"static/questions/all"
end

get '/questions/:id' do
	@question = Question.find(params[:id])
	erb :"static/questions/single"
end

get '/questions/:id/edit' do
	@questions = Question.find(params[:id])
	erb :"static/questions/singleedit"
end

post '/questions/:id/edit' do
		question = Question.find(params[:id])
		question.text = params[:question]
		question.save
		redirect '/questions'
end


