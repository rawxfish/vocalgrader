class Addshittoshit < ActiveRecord::Migration
  def up
    add_attachment :expected_waves, :file
    add_attachment :actual_waves, :file
  end

  def down
    add_attachment :expected_waves, :file
    add_attachment :actual_waves, :file
  end
end
