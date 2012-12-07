class PositionItem < ActiveRecord::Base
  belongs_to :linkedin_user
  belongs_to :position
  
  before_destroy :destroy_position
  
  def destroy_position
    self.position.destroy
  end
  
  attr_accessible :is_print_visible, :is_web_visible, :linkedin_user_id, :position_id
end
