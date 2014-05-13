class CreateWebsiteRanks < ActiveRecord::Migration
  def change
    create_table :website_ranks do |t|
      t.integer :user_id
      t.integer :website_id
      t.integer :custom_rank

      t.timestamps
    end
  end
end
