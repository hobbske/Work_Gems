class RemoveColumn < ActiveRecord::Migration
  def change
  	remove_column :samples, :user_id, :integer
  end
end
