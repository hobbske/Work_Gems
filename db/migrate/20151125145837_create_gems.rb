class CreateGems < ActiveRecord::Migration
  def change
    create_table :gems do |t|
      t.integer :user_id
      t.string :category
      t.string :title
      t.string :description
      t.boolean :marquee
      
      t.timestamps
    end
  end
end
