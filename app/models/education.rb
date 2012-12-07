class Education < ActiveRecord::Base
  belongs_to :linkedin_user
  attr_accessible :degree, :education_id, :end_date, :field_of_study, :school_name, :start_date, :linkedin_user_id
  
  scope :is_web_visible, where("education_items.is_web_visible = ?", true) 
  scope :is_print_visible, where("education_items.is_print_visible = ?", true)
  
end
