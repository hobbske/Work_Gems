class RemoveContactEmailFromProfile < ActiveRecord::Migration
  def change
    remove_column :profiles, :contact_email, :string
  end
end
