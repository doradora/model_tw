class PostTagship < ActiveRecord::Base
  attr_accessible :model_tag, :post
  belongs_to :model_tag
  belongs_to :post
end
