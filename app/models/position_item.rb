class PositionItem < ActiveRecord::Base
  belongs_to :linkedin_user
  belongs_to :position
  attr_accessible :is_print_visible, :is_web_visible, :linkedin_user_id, :position_id
end
