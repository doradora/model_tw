class AddGeneralOrAdult < ActiveRecord::Migration
	def change
		add_column :posts, :general, :boolean
	end
end
