class BadgeItem < ActiveRecord::Base
  belongs_to :codeschool_user
  belongs_to :badge
  
  before_destroy :destroy_badge
  
  def destroy_badge
    self.badge.destroy
  end
  
  attr_accessible :badge_id, :codeschool_user_id, :is_print_visible, :is_web_visible
end
