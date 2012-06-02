# encoding: utf-8
class Adult::PostsController < ApplicationController
	before_filter :authenticate_user! , :except => [ :show, :index ]
	def index
		@posts = Post.find_all_by_general(false)
	end

	def new
		@post = Post.new
		respond_to do |format|
			format.html
		end
	end
	
	def create
		@board = Board.find(params[:post][:board_id])
		@post = Post.create(params[:post])
		@post.user = current_user
		respond_to do |format|
	      if @post.save
	        format.html { redirect_to board_post_path(@board,@post), notice: 'Post was successfully created.' }
	        format.json { render json: @post, status: :created, location: @post }
	      else
	        format.html { render action: "new" }
	        format.json { render json: @post.errors, status: :unprocessable_entity }
	      end
    	end
	end
	
	def edit
		@board = Board.find(params[:board_id])
		@post = @board.posts.find(params[:id])
		respond_to do |format|
			format.html
		end
	end
	
	def update
		@board = Board.find(params[:board_id])
		@post = @board.posts.find(params[:id])
		respond_to do |format|
			if @post.update_attributes(params[:post])
				format.html{ redirect_to board_path(@board), notice: '成功修改'}
				format.json{ head :no_content}
			else
				format.html { render action: 'edit' }
				format.json { rendcder json: @board.errors,status: :unprocessable_entity}
			end
		end		
	end
	
	def destroy
		@board = Board.find(params[:board_id])
		@post = @board.posts.find(params[:id])
		@post.destroy
		respond_to do |format|
			format.html {redirect_to board_posts_path(@board), notice:'刪除成功'}
			format.json { head :no_content }
		end
	end

	def show
		@board = Board.find(params[:board_id])
		@post = @board.posts.find(params[:id])
		respond_to do |format|
			format.html
		end
	end

end
