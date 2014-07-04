task :import => :environment do
	Website.find_each do |website|
      begin
        page = MetaInspector.new(website.url)
        website.title_tags.find_or_create_by title: page.title
        website.description = page.description
        website.save
      rescue => e
        p "Error on website #{website.url}: #{e.message}"
      end
	end
end

task :getsites => :environment do
  SiteSource.find_each do |s|
    s.parse
  end
end
