class Directory < ActiveRecord::Base
  # I take root directory from http://www.iomwebguide.com/directory/index.shtml
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :websites
  scope :roots, -> { where(:level => 0) }
  has_many :subdir, class_name: 'Directory', :foreign_key => :parent_id
  belongs_to :parent, class_name: 'Directory'
end
