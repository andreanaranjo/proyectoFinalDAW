class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.references :member, foreign_key: true
      t.references :task, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
