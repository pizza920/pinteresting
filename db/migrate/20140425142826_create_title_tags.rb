class CreateTitleTags < ActiveRecord::Migration
  def change
    create_table :title_tags do |t|
      t.string :title
      t.integer :website_id

      t.timestamps
    end
  end
end
