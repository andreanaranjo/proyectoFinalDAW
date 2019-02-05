class CreateAnnouncements < ActiveRecord::Migration[5.2]
  def change
    create_table :announcements do |t|
      t.string :title
      t.text :fulltext
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
