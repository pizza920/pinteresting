class Website < ActiveRecord::Base
      has_many :title_tags
      has_many :website_rank
      belongs_to :directory
    def add_info
      begin
        page = MetaInspector.new(self.url)
        self.title_tags.find_or_create_by title: page.title
        self.description = page.description
        

        doc = Nokogiri::HTML(open self.url)
        self.description = doc.css('h1,h2,h3')[0..5].map(&:text).join('. ') if self.description.blank?
        self.description = doc.css('p,div')[0..5].map(&:text).join('. ') if self.description.blank?
        self.text_amount = doc.text.length
        self.content = doc.text
      rescue => e
       p e.message
      end
      self.save
    end
    def self.add_info
      Website.find_each do |website|
        website.add_info
      end
      Website.update_rank
    end

    def self.update_rank
      min = Website.where.not('text_amount is null or text_amount = 0').minimum(:text_amount).to_f
      max = Website.where.not('text_amount is null or text_amount = 0').maximum(:text_amount).to_f
      Website.where.not(text_amount: nil).update_all("rank = 1 + (text_amount - #{min})/(#{max} - #{min})*9.0") 
    end
end
