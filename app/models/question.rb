class Question < ActiveRecord::Base

	belongs_to :user
	has_many :answers
	has_many :qvotes

	def upvote_count
		@upvote_count ||= self.qvotes.where(vote: true).count
	end
end



