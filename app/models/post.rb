class Post < ActiveRecord::Base
	has_many :post_boardships
	has_many :boards, :through => :post_boardships
	belongs_to :user
  	attr_accessible :title, :content ,:user, :board
  	def posted_time
  		time = self.created_at
  		time = time.strftime("%m/%d %H:%M")
  	end
end
