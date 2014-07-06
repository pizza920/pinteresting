require 'open-uri'
class Pinterest::ParserIomwebguide
  def initialize(url)
    @url = url
  end
  def parse start_url = nil
    start_url ||= @url
    uri = URI.parse start_url
    doc = Nokogiri::HTML(open start_url)
    if doc.css('table#index_table').present?
      p doc.css('table#index_table td a').map &:text
      doc.css('table#index_table td a').each do |elem|
        directory_url = uri.scheme + '://' + uri.host + elem.attr('href')
        parse directory_url
      end
    else
      parse_directory doc
    end
  end

  def parse_directory(doc)
    directory_name = doc.css('h1').text.strip.gsub("\n",' ').gsub('  ',' ')
    directory = Directory.find_or_create_by_title directory_name
    doc.css('.result a.co_name').each do |elem|
      link = elem.attr('href')
      name = elem.text
      web = Website.find_or_create_by(url: link, directory: directory, name: name)
    end
  end
end
