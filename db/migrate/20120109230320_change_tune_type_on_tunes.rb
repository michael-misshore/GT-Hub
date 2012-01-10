class ChangeTuneTypeOnTunes < ActiveRecord::Migration
  def up
    change_column :tunes, :tune_type, :string, :default => 'Tarmac', :null => false
  end

  def down
    change_column :tunes, :tune_type, :string, :default => 'Grip', :null => false
  end
end
