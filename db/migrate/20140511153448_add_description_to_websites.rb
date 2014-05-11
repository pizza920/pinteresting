class AddDescriptionToWebsites < ActiveRecord::Migration
  def change
    add_column :websites, :description, :text
  end
end
