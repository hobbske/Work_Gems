class AddUserIdToGems < ActiveRecord::Migration
  def change
    add_column :gems, :user_id, :integer
  end
end
