class CreateTrialWaveEdges < ActiveRecord::Migration
  def change
    create_table :trial_wave_edges do |t|
      t.integer :trial_id
      t.integer :wave_id

      t.timestamps
    end
  end
end
