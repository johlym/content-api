class RenameIdentityHashToIdentityHashkey < ActiveRecord::Migration[5.0]
  def change
    rename_column :identities, :hash, :hashkey
  end
end
