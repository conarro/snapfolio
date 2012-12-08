class HomeController < ApplicationController
  
  def show
    @profile = params[:profile_name].nil? ? User.find(params[:id]) : User.find_by_profile_name(params[:profile_name])
    @owner = current_user.nil? ? false : current_user.id == params[:id].to_i
  end

  def edit
  end
end
