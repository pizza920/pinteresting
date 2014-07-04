class WebsitesController < ApplicationController
  def index
  	if current_user
      @websites = Website.joins(:website_rank).where('website_ranks.user_id=?',current_user.id).order('custom_rank desc')
    else
  	  @websites = Website.order('rank desc')
    end
    @websites= @websites.paginate(page: params[:page], per_page: 10)
  end
  def index_category
    @category = Directory.friendly.find params[:category]
  	if current_user
      @websites = @category.websites.joins(:website_rank).where('website_ranks.user_id=?',current_user.id).order('custom_rank desc')
    else
  	  @websites = @category.websites.order('rank desc')
    end
    @websites = @websites.paginate(page: params[:page], per_page: 10)
    render :index
  end

  def show
    @category = Directory.friendly.find params[:directory]
  	@website = Website.find params[:id]
  end
end
