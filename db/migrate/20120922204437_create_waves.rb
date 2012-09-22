class CreateWaves < ActiveRecord::Migration
	def change
		create_table :expected_waves do |t|
			t.integer :user_id

			t.timestamps
		end
		create_table :actual_waves do |t|
			t.integer :user_id

			t.timestamps
		end
	end
end
