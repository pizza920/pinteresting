class AddTextAmountToWebsites < ActiveRecord::Migration
  def change
    add_column :websites, :text_amount, :integer
  end
end
