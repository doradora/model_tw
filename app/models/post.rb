class Post < ActiveRecord::Base
	has_attached_file :excerpt_image, :styles => { :medium => '200x200>',:thumb => '100x100'}
	has_many :post_tagships
	has_many :model_tags, :through => :post_tagships
	belongs_to :user
	belongs_to :board
  	attr_accessible :title, :content ,:user, :board_id, :excerpt_image, :general
  	def posted_time
  		time = self.created_at
  		time = time.strftime("%m/%d %H:%M")
  	end
end
