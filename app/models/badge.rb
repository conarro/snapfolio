class Badge < ActiveRecord::Base
  belongs_to :codeschool_user
  attr_accessible :codeschool_user_id, :course_url, :name, :url
  
  scope :is_web_visible, where("badge_items.is_web_visible = ?", true) 
  scope :is_print_visible, where("badge_items.is_print_visible = ?", true)
  
end
