class Website < ActiveRecord::Base
      has_many :title_tags
      has_many :website_rank
end
