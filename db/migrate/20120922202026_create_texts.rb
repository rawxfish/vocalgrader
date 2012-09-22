class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.string :path
      t.integer :wave_id

      t.timestamps
    end
  end
end
