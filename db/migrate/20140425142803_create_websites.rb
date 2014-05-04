class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.string :url
      t.string :name
      has_many :title_tags

      t.timestamps
    end
  end
end
