class CreateAnswerVote < ActiveRecord::Migration
	def change
		create_table :avotes do |t|
			t.integer :answer_id
			t.integer :user_id
			t.boolean :vote 
		end
	end
end
