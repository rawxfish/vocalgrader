class CreateTrials < ActiveRecord::Migration
  def change
    create_table :trials do |t|
      t.string :name
      t.integer :user_id
      t.string :expected
      t.string :actual
      t.integer :grade_1
      t.integer :grade_2
      t.integer :grade_3
      t.integer :grade_4
      t.integer :grade_5
      t.integer :grade_6

      t.timestamps
    end
    add_index :trials, [:user_id]
  end
end
