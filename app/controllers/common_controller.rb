class CommonController < ApplicationController
	before_filter :authenticate_user! , :except => [ :show, :index ]
	def index
		@posts = Post.find_all_by_general(true)
	end

	def show
	end
end
