class AddRankToWebsites < ActiveRecord::Migration
  def change
    add_column :websites, :rank, :integer
  end
end
