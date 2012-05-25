class Post < ActiveRecord::Base
	belongs_to :board
	belongs_to :user
  	attr_accessible :title, :content ,:user
  	def posted_time
  		time = self.created_at
  		time = time.strftime("%m/%d %H:%M")
  	end
end
