class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.string :content
      t.references :post, foreign_key: true
      t.string :author
      t.references :member, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
