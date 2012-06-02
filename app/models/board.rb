class Board < ActiveRecord::Base
  attr_accessible :name,:string
  has_many :posts
end
