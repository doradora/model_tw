class CreateModelTags < ActiveRecord::Migration
  def change
    create_table :model_tags do |t|
    	t.string :name
    	t.string :describe
      t.timestamps
    end
  end
end
