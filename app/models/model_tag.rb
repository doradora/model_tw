class ModelTag < ActiveRecord::Base
  # attr_accessible :title, :body
  	has_many :post_tagships
	has_many :posts, :through => :post_tagships
	attr_accessible :name, :describe
end
