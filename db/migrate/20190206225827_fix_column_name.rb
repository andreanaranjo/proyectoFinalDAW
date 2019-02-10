class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :user, :password, :password_digest
  end
end
