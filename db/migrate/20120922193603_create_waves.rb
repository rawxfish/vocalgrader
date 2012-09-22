class CreateWaves < ActiveRecord::Migration
  def change
    create_table :waves do |t|
      t.string :path
      t.references :musician, :polymorphic => true
      t.timestamps
    end
  end
end
