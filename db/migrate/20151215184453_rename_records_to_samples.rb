class RenameRecordsToSamples < ActiveRecord::Migration
  def change
    rename_table :records, :samples
  end
end
