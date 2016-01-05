class CreateQuestionVote < ActiveRecord::Migration
	def change
		create_table :qvotes do |t|
			t.integer :question_id
			t.integer :user_id
			t.boolean :vote 
		end
	end
end
