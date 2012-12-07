class AuthenticationsController < ApplicationController
  before_filter :remove_associated_data, :only => :destroy
  
  # GET /authentications
  # GET /authentications.json
  def index
    @authentications = current_user.authentications if current_user
  end

  # POST /authentications
  # POST /authentications.json
  def create
    #raise request.env["omniauth.auth"].to_yaml #['extra']['raw_info'].to_yaml #['educations']['values'].inspect
    omniauth = request.env["omniauth.auth"]
    authentication = current_user.authentications.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if authentication
      authentication.update_attributes(:token => omniauth['credentials']['token'], :secret => omniauth['credentials']['secret'])
      flash[:notice] = "Signed in successfully"
      sign_in_and_redirect(:user, authentication.user)
    elsif current_user
      if Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
        flash[:error] = "This #{omniauth['provider'].titleize} account is already associated with a Snapfol.io account. Please sign in using that account or authenticate with a different #{omniauth['provider'].titleize} account."
        redirect_to edit_user_registration_path
      else
        current_user.authentications.create!(:provider          => omniauth['provider'],
                                             :uid               => omniauth['uid'],
                                             :token             => omniauth['credentials']['token'],
                                             :secret            => omniauth['credentials']['secret'])
        flash[:notice] = "#{omniauth['provider'].titleize} connected!"
        build_user_profile(omniauth)
        redirect_to edit_user_registration_path
      end
    else
      user = User.new
      user.authentications.build(:provider          => omniauth['provider'],
                                 :uid               => omniauth['uid'], 
                                 :token             => omniauth['credentials']['token'],
                                 :secret            => omniauth['credentials']['secret'],
                                 :username          => omniauth['extra']['raw_info']['screen_name'],
                                 :profile_image_url => omniauth['extra']['raw_info']['profile_image_url'])
      user.save!
      flash[:notice] = "Signed in successfully"
      sign_in_and_redirect(:user, user)
    end
  end

  # DELETE /authentications/1
  # DELETE /authentications/1.json
  def destroy
    @authentication.destroy
    flash[:notice] = "#{@authentication.provider.titleize} disconnected"
    redirect_to edit_user_registration_path
  end
  
  def build_user_profile omniauth
    case omniauth['provider']
    when 'linkedin'
      current_user.build_linkedin_profile(omniauth)
    when 'github'
      current_user.build_github_profile(omniauth)
    when 'stackexchange'
      current_user.build_stackexchange_profile(omniauth)
    else
      Rails.logger.info "Omniauth provider doesn't match existing support"
    end
  end
  
  protected
  
  def remove_associated_data
    @authentication = current_user.authentications.find(params[:id])
    case @authentication.provider
    when 'linkedin'
      current_user.linkedin_user.destroy
    when 'github'
      current_user.github_user.destroy
    when 'stackexchange'
      current_user.stackexchange_user.destroy
    end
  end
  
end
