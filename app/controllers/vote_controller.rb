post '/questions/:question_id/upvote' do
	# if vote = Qvote.find(params[:vote_id])
	vote_exist = Qvote.where(question_id: params[:question_id], user_id: session[:user_id])

	if vote_exist.empty?
		vote = Qvote.new(question_id: params[:question_id], user_id: current_user.id, vote: true)
		vote.save
		redirect '/questions'
	else
		if vote_exist.first.vote == true
			Qvote.delete(vote_exist.first.id)
			redirect '/questions'
		else 
			vote_exist.first.update(vote: true)
			redirect '/questions'
		end
	end
end

post '/questions/:question_id/downvote' do
	# if vote = Qvote.find(params[:vote_id])
	vote_exist = Qvote.where(question_id: params[:question_id], user_id: session[:user_id])

	if vote_exist.empty?
		vote = Qvote.new(question_id: params[:question_id], user_id: current_user.id, vote: false)
		vote.save
		redirect '/questions'
	else
		if vote_exist.first.vote == false
			Qvote.delete(vote_exist.first.id)
			redirect '/questions'
		else 
			vote_exist.first.update(vote: false)
			redirect '/questions'
		end
	end
end



