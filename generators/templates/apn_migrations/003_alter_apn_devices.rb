class AlterApnDevices < ActiveRecord::Migration # :nodoc:
  
  module APN # :nodoc:
    class Device < ActiveRecord::Base # :nodoc:
      set_table_name 'apn_devices'
    end
  end
  
  def self.up
    add_column :apn_devices, :last_registered_at, :datetime
    
    execute 'update apn_devices set last_registered_at = created_at'

    change_column :apn_devices, :token, :string, :size => 100, :null => false
    add_index :apn_devices, :token, :unique => true
  end

  def self.down
    change_column :apn_devices, :token, :string
    remove_index :apn_devices, :column => :token
    remove_column :apn_devices, :last_registered_at
  end
end
