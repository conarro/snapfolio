class Position < ActiveRecord::Base
  belongs_to :linkedin_user
  attr_accessible :company, :company_id, :end_date, :is_current, :position_id, :start_date, :title, :linkedin_user_id
  
  scope :is_web_visible, where("position_items.is_web_visible = ?", true) 
  scope :is_print_visible, where("position_items.is_print_visible = ?", true) 

end
