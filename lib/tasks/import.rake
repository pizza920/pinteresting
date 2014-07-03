task :import => :environment do
	Website.find_each do |website|
    page = MetaInspector.new(website.url)
    website.title_tags.create title: page.title
    website.description = page.description
    website.save
	end
end

task :getsites => :environment do
  SiteSource.find_each do |s|
    s.parse
  end
end
