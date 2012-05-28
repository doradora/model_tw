class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :board
      t.string :title
      t.text :content
      t.references :user
      t.timestamps
    end
  end
end
