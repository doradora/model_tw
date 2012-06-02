class RenamePostsTagship < ActiveRecord::Migration
def change
	rename_table :post_boardships , :post_tagships
end

end
