class PostBoardship < ActiveRecord::Base
  attr_accessible :board_id, :post_id
  belongs_to :board
  belongs_to :post
end
