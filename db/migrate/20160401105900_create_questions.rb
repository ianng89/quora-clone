class CreateQuestions < ActiveRecord::Migration
	def change
		create_table :questions do |t|
			t.string :q_text
			t.integer :user_id
		end
	end
end
