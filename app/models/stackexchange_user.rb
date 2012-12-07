class StackexchangeUser < ActiveRecord::Base
  belongs_to :user
  attr_accessible :bronze_badge_count, :gold_badge_count, :photo_url, :profile_id, :profile_url, :reputation, :silver_badge_count, :user_id, :username

  def client
    #Github.new(:oauth_token => "#{self.user.get_auth('github').token}")
  end

end
