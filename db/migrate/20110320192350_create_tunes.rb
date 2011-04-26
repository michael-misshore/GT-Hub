class CreateTunes < ActiveRecord::Migration
  def self.up
    create_table :tunes do |t|
      t.integer :car_id
      t.integer :user_id
      t.integer :track_id
      t.integer :karma, :null => false, :default => 0
      t.column :tune_type, "ENUM('drift', 'drag', 'grip')", :null => false, :default => 'grip'

      t.timestamps
    end
  end

  def self.down
    drop_table :tunes
  end
end
