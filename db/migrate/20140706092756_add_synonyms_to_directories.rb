class AddSynonymsToDirectories < ActiveRecord::Migration
  def change
    add_column :directories, :synonyms, :text
  end
end
