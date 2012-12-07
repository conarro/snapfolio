class Repo < ActiveRecord::Base
  belongs_to :github_user
  attr_accessible :created_at, :description, :name, :pushed_at, :repo_id, :url, :repo_created_at
  
  #accepts_nested_attributes_for :repo_items
  
  scope :is_web_visible, where("repo_items.is_web_visible = ?", true) 
  scope :is_print_visible, where("repo_items.is_print_visible = ?", true)
  
end
