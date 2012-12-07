class RepoItem < ActiveRecord::Base
  belongs_to :github_user
  belongs_to :repo
  
  attr_accessible :github_user_id, :is_print_visible, :is_web_visible, :repo_id
end
