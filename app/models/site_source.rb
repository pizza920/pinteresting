class SiteSource < ActiveRecord::Base
  PARSERS = %w(Pinterest::ParserIsleOfMan
               Pinterest::ParserFinditIomToday
               Pinterest::ParserIomchamber
               Pinterest::ParserIomwebguide
               Pinterest::ParserAgeIsleOfMan
              )
  def parse
    current_parser = self.parser.constantize.new self.url
    current_parser.parse
  end
end
