class HomeController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_linkedin_auth
  
  def show
  end

  def edit
  end
end
