class AddFieldsToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :carrera, :string
    add_column :members, :email, :string
    add_column :members, :about_me, :text
  end
end
