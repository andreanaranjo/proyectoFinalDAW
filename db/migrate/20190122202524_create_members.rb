class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name
      t.string :last_name
      t.date :dob
      t.date :date_ingreso

      t.timestamps
    end
  end
end
