require 'open-uri'
class Pinterest::ParserIomchamber
  def initialize(url)
    @url = url
  end
  def parse
    uri = URI.parse @url
    doc = Nokogiri::HTML(open @url)
    doc.css('select[name=category] option').each do |elem|
      next unless elem.attr('value') 
      directory_name = elem.text.strip.gsub("\n",' ').gsub('  ',' ')
      directory_url = @url + "?category=" + elem.attr('value')
      directory = Directory.find_or_create_by_title directory_name
      parse_directory directory, directory_url
    end
  end

  def parse_directory(directory, first_url)
    url_for_parse = URI.parse first_url
    doc = Nokogiri::HTML(open url_for_parse)
    next_url = doc.css('a:contains("Next")').last
    next_url = url_for_parse.scheme + "://" + url_for_parse.host + next_url.attr('href') if next_url.present?
    parse_directory(directory, next_url) if next_url.present?
    doc.css('.memberInfo').each do |elem|
      name = elem.css('h2').text.strip
      link_el = elem.css('li.website a')
      Website.find_or_create_by(url: link_el.attr('href').to_s, directory: directory, name: name.to_s) if link_el.present?
    end
  rescue => e
    p "Failed download directory: #{first_url}."
    p "Error: #{e.message}"
  end
end
