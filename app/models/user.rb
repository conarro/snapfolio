class User < ActiveRecord::Base
  has_many :authentications
  has_one :linkedin_user
  has_one :github_user
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  
  def has_auth? provider
    !self.authentications.find_by_provider(provider).nil?
  end
  
  def get_auth provider
    self.authentications.find_by_provider(provider)
  end
  
  def build_linkedin_profile omniauth=nil
    if omniauth
      Rails.logger.info "Omniauth - creating linkedin user..."
      lu = LinkedinUser.create!(:user_id          => self.id,
                                 :first_name       => omniauth['extra']['raw_info']['firstName'],
                                 :last_name        => omniauth['extra']['raw_info']['lastName'],
                                 :headline         => omniauth['extra']['raw_info']['headline'],
                                 :photo_url        => omniauth['extra']['raw_info']['pictureUrl'],
                                 :email            => omniauth['extra']['raw_info']['emailAddress'],
                                 :industry         => omniauth['extra']['raw_info']['industry'],
                                 :profile_url      => omniauth['extra']['raw_info']['publicProfileUrl'],
                                 :location_name    => omniauth['extra']['raw_info']['location']['name'],
                                 :location_country => omniauth['extra']['raw_info']['location']['country']['code'],
                                 :profile_id       => omniauth['extra']['raw_info']['id'])
      Rails.logger.info "Omniauth - adding education..."
      lu.build_profile(omniauth)
    else
      client = self.linkedin_user.client
    end
  end
  
  def build_github_profile omniauth=nil
    if omniauth
      Rails.logger.info "Omniauth - creating github user..."
      gu = GithubUser.create!(:user_id          => self.id,
                                 :username       => omniauth['info']['nickname'],
                                 :photo_url        => omniauth['info']['image'],
                                 :profile_url      => omniauth['info']['urls']['GitHub'],
                                 :profile_id       => omniauth['extra']['raw_info']['id'])
      gu.build_profile
    else
      client = self.github_user.client
    end
  end
      
end