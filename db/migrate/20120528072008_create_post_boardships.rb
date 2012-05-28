class CreatePostBoardships < ActiveRecord::Migration
  def change
    create_table :post_boardships do |t|
      t.references :post
      t.references :board
      t.timestamps
    end
  end
end
