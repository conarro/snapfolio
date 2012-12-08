class CodeschoolUsersController < ApplicationController
  def create
    @codeschool_user = CodeschoolUser.new(:user_id => current_user.id, :username => params[:codeschool_user][:username])
    if @codeschool_user.save
      @codeschool_user.build_profile
      flash[:notice] = 'Code School connected!'
    else
      Rails.logger.debug @codeschool_user.errors.full_messages.join("\n")
      flash[:error] = "#{@codeschool_user.errors.full_messages.join("\n")}"
    end
    redirect_to edit_user_registration_path(current_user)
  end

  def destroy
    @codeschool_user = current_user.codeschool_user
    @codeschool_user.destroy
    flash[:notice] = 'Code school disconnected'
    redirect_to edit_user_registration_path(current_user)
  end
  
end
