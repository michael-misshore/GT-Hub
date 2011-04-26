class CreatePartsTunes < ActiveRecord::Migration
  def self.up
    create_table :parts_tunes, :id => false do |t|
      t.integer :part_id
      t.integer :tune_id
    end
  end

  def self.down
    drop_table :parts_tunes
  end
end
