class AddIndexToGems < ActiveRecord::Migration
  def change
    add_index :gems, :user_id
  end
end
