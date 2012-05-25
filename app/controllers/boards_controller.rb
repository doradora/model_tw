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

	def new
		@board = Board.new

		respond_to do |format|
			format.html
			format.json { render json: @board}
		end
	end
	
	def create
		@board = Board.new(params[:board])
		respond_to do |format|
	      if @board.save
	        format.html { redirect_to board_path(@board), notice: 'Board was successfully created.' }
	        format.json { render json: @board, status: :created, location: @board }
	      else
	        format.html { render action: "new" }
	        format.json { render json: @board.errors, status: :unprocessable_entity }
	      end
   		end
	end
	
	def edit
		@board = Board.find(params[:id])
		respond_to do |format|
			format.html
			format.json { render json: @board}
		end
	end
	
	def update
		@board = Board.find(params[:id])
		respond_to do |format|
			if @board.update_attributes(params[:board])
				format.html{ redirect_to @board, notice: '成功修改'}
				format.json{ head :no_content}
			else
				format.html { render action: 'edit' }
				format.json { rendcder json: @board.errors,status: :unprocessable_entity}
			end
		end
	end
	
	def show
		@board = Board.find(params[:id])
		@posts = @board.posts.all
	    respond_to do |format|
	      format.html # show.html.erb
	      format.json { render json: @board }
	    end
	end

	def destroy
		@board = Board.find(params[:id])
		@board.destroy
		respond_to do |format|
			format.html {redirect_to boards_path, notice:'刪除成功'}
			format.json { head :no_content }
		end
	end
end
