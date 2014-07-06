class AddCountCategoriesToRoots < ActiveRecord::Migration
  def change
    add_column :directories, :sub_count, :integer
    Directory.roots.find_each do |r|
      r.sub_count = r.subdir.count
      r.save
    end
  end
end
