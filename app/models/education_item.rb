class EducationItem < ActiveRecord::Base
  belongs_to :linkedin_user
  belongs_to :education
  
  before_destroy :destroy_education
  
  def destroy_education
    self.education.destroy
  end
  
  attr_accessible :education_id, :is_print_visible, :is_web_visible, :linkedin_user_id
end
