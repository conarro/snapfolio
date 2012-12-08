class RecommendationItem < ActiveRecord::Base
  belongs_to :linkedin_user
  belongs_to :recommendation
  
  attr_accessible :is_print_visible, :is_web_visible, :linkedin_user_id, :recommendation_id
  
  before_destroy :destroy_recommendation
  
  def destroy_recommendation
    self.recommendation.destroy
  end

end
