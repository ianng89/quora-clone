class CreateAnswers < ActiveRecord::Migration
	def change
		create_table :answers do |t|
			t.string :a_text
			t.string :questions_id
			t.integer :user_id
		end
	end
end