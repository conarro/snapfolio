class RepoItem < ActiveRecord::Base
  belongs_to :github_user
  belongs_to :repo
  
  before_destroy :destroy_repo
  
  def destroy_repo
    self.repo.destroy
  end
  
  attr_accessible :github_user_id, :is_print_visible, :is_web_visible, :repo_id
end
