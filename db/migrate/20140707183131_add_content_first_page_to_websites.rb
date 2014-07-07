class AddContentFirstPageToWebsites < ActiveRecord::Migration
  def change
    add_column :websites, :content, :text
  end
end
