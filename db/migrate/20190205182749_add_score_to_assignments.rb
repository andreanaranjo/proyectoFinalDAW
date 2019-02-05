class AddScoreToAssignments < ActiveRecord::Migration[5.2]
  def change
    add_column :assignments, :score, :integer
  end
end
