class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def check_linkedin_auth
    unless !!current_user.authentications.find_by_provider('linkedin')
      flash[:error] = "Please authenticate with Linkedin"
      redirect_to edit_user_registration_path
    end
  end
  
end
