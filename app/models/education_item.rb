class EducationItem < ActiveRecord::Base
  belongs_to :linkedin_user
  belongs_to :education
  attr_accessible :education_id, :is_print_visible, :is_web_visible, :linkedin_user_id
end
