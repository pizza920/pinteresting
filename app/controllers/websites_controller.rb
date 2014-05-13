class WebsitesController < ApplicationController
  def index
  	if current_user
 			@websites = Website.join(:website_rank).where(user_id: current_user.id).order('custom_rank desc').all
		else
  	  @websites = Website.order('rank desc').all
end
  end

  def show
  	@website = Website.find params[:id]
  end
end
