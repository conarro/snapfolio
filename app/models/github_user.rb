class GithubUser < ActiveRecord::Base
  belongs_to :user
  has_many :repo_items
  has_many :repos, :through => :repo_items, :dependent => :destroy
  
  attr_accessible :photo_url, :profile_id, :profile_url, :username, :user_id
  
  def client
    Github.new(:oauth_token => "#{self.user.get_auth('github').token}")
  end
  
  def build_profile
    self.client.repos.list.each do |r|
      Rails.logger.info "Omniauth - adding repos..."
      self.repos.create!(:repo_id => r.id,
                         :name => r.name,
                         :description => r.description,
                         :url => r.url,
                         :repo_created_at => r.created_at,
                         :pushed_at => r.pushed_at)
    end
  end
  
end
