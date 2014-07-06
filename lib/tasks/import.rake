task :import => :environment do
  Website.add_info
end

task :getsites => :environment do
  SiteSource.find_each do |s|
    s.parse
  end
end
