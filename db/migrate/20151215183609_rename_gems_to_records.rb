class RenameGemsToRecords < ActiveRecord::Migration
  def change
  	rename_table :gems, :records
  end
end
