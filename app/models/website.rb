class Website < ActiveRecord::Base
      has_many :title_tags
      has_many :website_rank
      belongs_to :directory
    def add_info
      page = MetaInspector.new(self.url)
      self.title_tags.find_or_create_by title: page.title
      self.description = page.description
      doc = Nokogiri::HTML(open self.url)
      self.text_amount = doc.text.length
      self.save
    end
end
