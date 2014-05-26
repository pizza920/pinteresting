class CreateSiteSources < ActiveRecord::Migration
  def change
    create_table :site_sources do |t|
      t.string :title
      t.string :url
      t.string :parser

      t.timestamps
    end
  end
end
