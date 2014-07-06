namespace :categories do
  desc 'set parent category'
  task :setparent => :environment do
    Directory.setparents
  end

  task :gettitles_no_parent => :environment do
    File.open(Rails.root.join('tmp', 'noparents.txt'),'w') do |f|
      Directory.no_parent.find_each do |c|
        f.write "#{c.id} #{c.title}\n"
      end
    end
  end
end 
