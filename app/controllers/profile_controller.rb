class ProfileController < ApplicationController
  before_action :authenticate_user!
  def show
    @profile = current_user.profile || current_user.create_profile
  end
  def update
    @profile = current_user.profile || current_user.create_profile
    @profile.update_attributes(profile_params)
    render :show
  end
  private
  def profile_params
    params.require(:profile).permit(:rank)
  end
end
