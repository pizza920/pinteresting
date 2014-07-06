class Directory < ActiveRecord::Base
  # I take root directory from http://www.iomwebguide.com/directory/index.shtml
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :websites
  scope :roots, -> { where(:level => 0) }
  scope :no_parent, -> { where(:parent_id => nil).where(:level => nil) }
  default_scope -> {order('position asc')}
  has_many :subdir, class_name: 'Directory', :foreign_key => :parent_id
  belongs_to :parent, class_name: 'Directory'
  
  def self.setparents
    Directory.update_all parent_id: nil
    Directory.roots.order('position asc').each do |root|
      p root.title
      synonyms = root.synonyms.split(',').map(&:strip).map(&:downcase)
      Directory.no_parent.each do |cat|
        p cat.id
        synonyms.each do |synonym|
          p cat.title
          p synonym
          if cat.title.downcase.match synonym
            p 'matched!'
            cat.parent_id = root.id
            cat.save
          end
        end
      end
    end
    Directory.set_sub_count
    nil
  end

  def self.set_sub_count
    Directory.roots.each  do |root|
      root.sub_count = root.subdir.count
      root.save
    end
  end
end
