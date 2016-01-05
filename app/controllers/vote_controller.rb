post '/questions/:question_id/upvote' do
	# if vote = Qvote.find(params[:vote_id])
	if (vote = Qvote.find_by question_id: params[:question_id])
		vote.update(vote: true)
	else	
	vote = Qvote.new(question_id: params[:question_id] ,user_id: current_user.id, vote: true)
	end
	vote.save
	redirect '/questions'
end


post '/questions/:question_id/downvote' do
	if (vote = Qvote.find_by question_id: params[:question_id])
		vote.update(vote: false)
	else
	vote = Qvote.new(question_id: params[:question_id] ,user_id: current_user.id, vote: false)
	end
	vote.save
	redirect '/questions'
end