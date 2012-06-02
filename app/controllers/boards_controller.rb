# encoding: utf-8
class BoardsController < ApplicationController
	before_filter :authenticate_user! , :except => [ :show, :index ]
	def index
		@boards = Board.all

		respond_to do |format|
			format.html
			format.json {render json: @boards}
		end
	end
	def show
		@board = Board.find(params[:id])
		@posts = @board.posts
	    respond_to do |format|
	      format.html # show.html.erb
	      format.json { render json: @board }
	    end
	end
end
	
