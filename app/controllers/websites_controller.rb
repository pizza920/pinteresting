class WebsitesController < ApplicationController
  def index
  end

  def index_category
    @category = Directory.where(slug: params[:category]).first
    if @category
      @websites = @category.websites
    else
      @websites = Website
    end
    if current_user
      #@websites = @category.websites.joins(:website_rank).where('website_ranks.user_id=?',current_user.id).order('custom_rank desc')
      my_rank = current_user.profile.try(:rank) || 0
      @websites = @websites.order(my_rank >= 5 ? 'rank desc' : 'rank asc')
    else
      @websites = @websites.order('rank desc')
    end

    query = "%#{params[:search]}%"
    @websites= @websites.joins(:title_tags).where("name like ? or title_tags.title like ? or description like ? or content like ?", query,query,query, query) if params[:search].present?
    @websites = @websites.paginate(page: params[:page], per_page: 10)
  end

  def show
    @category = Directory.friendly.find params[:directory]
  	@website = Website.find params[:id]
  end
end
