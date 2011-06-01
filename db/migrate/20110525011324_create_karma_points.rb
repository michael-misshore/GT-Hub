class CreateKarmaPoints < ActiveRecord::Migration
  def self.up
    create_table :karma_points do |t|
      t.integer :tuner_id
      t.integer :tune_id
      t.integer :karma

      t.timestamps
    end
  end

  def self.down
    drop_table :karma_points
  end
end
