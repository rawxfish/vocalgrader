class CreateTrialWaveEdges < ActiveRecord::Migration
	def change
		create_table :trial_expected_edges do |t|
			t.integer :trial_id
			t.integer :wave_id

			t.timestamps
		end

		create_table :trial_actual_edges do |t|
			t.integer :trial_id
			t.integer :wave_id

			t.timestamps
		end
	end
end
