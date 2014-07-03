class AddDirectoryIdToWebsites < ActiveRecord::Migration
  def change
    add_column :websites, :directory_id, :integer
  end
end
