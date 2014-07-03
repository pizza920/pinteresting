class CreateDirectories < ActiveRecord::Migration
  def change
    create_table :directories do |t|
      t.string :title
      t.float :rank
      t.integer :position

      t.timestamps
    end
  end
end
