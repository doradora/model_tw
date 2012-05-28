class Board < ActiveRecord::Base
	has_many :post_boardships
	has_many :posts, :through => :post_boardships
	attr_accessible :name, :string
  # attr_accessible :title, :body
end
