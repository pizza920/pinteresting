task :import => :environment do
	Website.find_each do |website|
    page = MetaInspector.new(website.url)
    website.title_tags.create title: page.title
	end
end