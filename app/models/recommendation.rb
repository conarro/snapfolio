class Recommendation < ActiveRecord::Base
  belongs_to :linkedin_user
  attr_accessible :recommendation_id, :recommender, :text, :type
  
  scope :is_web_visible, where("recommendation_items.is_web_visible = ?", true) 
  scope :is_print_visible, where("recommendation_items.is_print_visible = ?", true)
  
end
