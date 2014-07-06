require 'open-uri'
class Pinterest::ParserIsleOfMan
  def initialize(url)
    @url = url
  end
  def parse
    uri = URI.parse @url
    doc = Nokogiri::HTML(open @url)
    doc.css('#quick-search ul li a').each do |elem|
      directory_name = elem.text.strip.gsub("\n",' ').gsub('  ',' ')
      directory_url = uri.scheme + '://' + uri.host + elem.attr('href')
      directory = Directory.find_or_create_by_title directory_name
      parse_directory directory, directory_url
    end
  end

  def parse_directory(directory, first_url)
    url_for_parse = URI.parse first_url
    doc = Nokogiri::HTML(open url_for_parse)
    next_url = doc.css('a:contains(" >")').last.try :attr, 'href'
    next_url = url_for_parse.scheme + "://" + url_for_parse.host + next_url if next_url.present?
    parse_directory(directory, next_url) if next_url.present?
    doc.css('.premium-listing,.standard-listing').each do |el|
      link_el = el.css('a[target="_blank"]').first
      if link_el.present?
        name = el.css('h3').text.strip
        link = link_el.attr('href')
        web = Website.find_or_create_by(url: link, directory: directory, name: name)
      end
    end
  end
end
