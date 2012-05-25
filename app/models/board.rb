class Board < ActiveRecord::Base
	has_many :posts
	attr_accessible :name, :string
  # attr_accessible :title, :body
end
