class DeviseCreateTuners < ActiveRecord::Migration
  def self.up
    create_table(:tuners) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :tuners, :email,                :unique => true
    add_index :tuners, :reset_password_token, :unique => true
    # add_index :tuners, :confirmation_token,   :unique => true
    # add_index :tuners, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :tuners
  end
end
