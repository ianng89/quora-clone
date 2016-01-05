class Question < ActiveRecord::Base

	belongs_to :user
	has_many :answers
	has_many :qvotes

	def upvote_count
		@upvote_count ||= self.qvotes.where(vote: true).count
	end
end



 # scope :top5,
 #    select("songs.id, OTHER_ATTRS_YOU_NEED, count(listens.id) AS listens_count").
 #    joins(:listens).
 #    group("songs.id").
 #    order("listens_count DESC").
 #    limit(5)
