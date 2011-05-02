class CreateTunes < ActiveRecord::Migration
  def self.up
    create_table :tunes do |t|
      t.integer :car_id
      t.integer :user_id
      t.integer :track_id
      t.integer :karma, :null => false, :default => 0
      t.string :tune_type, :null => false, :default => 'Grip'

      t.timestamps
    end
  end

  def self.down
    drop_table :tunes
  end
end
