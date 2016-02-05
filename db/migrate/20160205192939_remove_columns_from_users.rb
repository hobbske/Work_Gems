class RemoveColumnsFromUsers < ActiveRecord::Migration
  def self.up
  	remove_column :users, :name
  	remove_column :users, :provider
  	remove_column :users, :uid
  end
end
