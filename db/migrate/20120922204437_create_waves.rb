class CreateWaves < ActiveRecord::Migration
	def change
		create_table :expected_waves do |t|
			t.integer :trial_id

			t.timestamps
		end

		create_table :actual_waves do |t|
			t.integer :trial_id

			t.timestamps
		end
	end
end
