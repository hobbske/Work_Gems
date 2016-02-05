class DropIdentitiesTable < ActiveRecord::Migration
  def up
    drop_table :identities
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
