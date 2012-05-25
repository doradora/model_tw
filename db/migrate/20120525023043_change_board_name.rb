class ChangeBoardName < ActiveRecord::Migration
  def change
  	rename_column(:boards, :board_name, :name)

  end

end
