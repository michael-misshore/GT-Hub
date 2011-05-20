class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :name, :null => false
      t.text :message
      t.integer :admin_id, :null => false
      t.integer :private, :null => false

      t.timestamps
    end
    
    add_index :groups, :name, :unique => true
  end

  def self.down
    drop_table :groups
  end
end
