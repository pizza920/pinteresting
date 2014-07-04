class AddParentIdAndLevelToDirectory < ActiveRecord::Migration
  def change
    add_column :directories, :parent_id, :integer
    add_column :directories, :level, :integer
  end
end
