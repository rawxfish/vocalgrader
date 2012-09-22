class CreateTrials < ActiveRecord::Migration
  def change
    create_table :trials do |t|
      t.string :name
      t.references :user

      t.timestamps
    end
    add_index :trials, [:user_id]
  end
end
