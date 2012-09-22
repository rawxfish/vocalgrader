class CreateWaves < ActiveRecord::Migration
  def change
    create_table :waves do |t|
      t.string :path
      t.timestamps
    end
  end
end
