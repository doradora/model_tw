# encoding: utf-8
class PostsController < ApplicationController
	before_filter :authenticate_user! , :except => [ :show, :index ]
	def index
		@posts = Post.find_all_by_general(true)
	end

	def new
		@post = Post.new
		respond_to do |format|
			format.html
		end
	end
	
	def create
		@post = Post.create(params[:post])
		@post.user = current_user
		respond_to do |format|
	      if @post.save
	        format.html { redirect_to post_path(@post), notice: 'Post was successfully created.' }
	        format.json { render json: @post, status: :created, location: @post }
	      else
	        format.html { render action: "new" }
	        format.json { render json: @post.errors, status: :unprocessable_entity }
	      end
    	end
	end
	
	def edit
		@post = Post.find(params[:id])
		respond_to do |format|
			format.html
		end
	end
	
	def update
		@post = Post.find(params[:id])
		respond_to do |format|
			if @post.update_attributes(params[:post])
				format.html{ redirect_to posts_path, notice: '成功修改'}
				format.json{ head :no_content}
			else
				format.html { render action: 'edit' }
				format.json { rendcder json: @board.errors,status: :unprocessable_entity}
			end
		end		
	end
	
	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		respond_to do |format|
			format.html {redirect_to posts_path(), notice:'刪除成功'}
			format.json { head :no_content }
		end
	end

	def show
		@post = Post.find(params[:id])
		respond_to do |format|
			format.html
		end
	end

end
