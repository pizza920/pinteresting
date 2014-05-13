class WebsitesController < ApplicationController
  def index
  	@websites = Website.order('rank desc').all
  end

  def show
  	@website = Website.find params[:id]
  end
end