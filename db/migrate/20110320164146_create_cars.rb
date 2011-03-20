class CreateCars < ActiveRecord::Migration
  def self.up
    create_table :cars do |t|
      t.timestamps
      
      t.string :make, :null => false
      t.integer :year
      t.string :model, :null => false
      t.boolean :premium, :default => false
      t.boolean :standard, :default => false
    end
  end

  def self.down
    drop_table :cars
  end
end
