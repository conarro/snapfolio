class ReposController < ApplicationController
  def edit
  end

  def update
    @repo = current_user.repos.find(params[:repo])
    raise @repo
  end
  
  def change_web_pref
    @repo = current_user.github_user.repos.find(params[:repo])
    item = RepoItem.find_by_repo_id(@repo.id)
    item.is_web_visible ? item.update_attributes(:is_web_visible => false) : item.update_attributes(:is_web_visible => false)
    redirect_to home_path(current_user)      
  end
end
