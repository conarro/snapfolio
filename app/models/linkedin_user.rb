class LinkedinUser < ActiveRecord::Base
  belongs_to :user
  has_many :education_items
  has_many :position_items
  has_many :educations, :through => :education_items
  has_many :positions, :through => :position_items
  
  attr_accessible :user_id, :email, :first_name, :headline, :industry, :last_name, :location_country, :location_name, :photo_url, :profile_id, :profile_url
  
  def client
    client = LinkedIn::Client.new('3znaup2e1xk3','WnaqGyEvIYPKrBYQ')
    client.authorize_from_access(auth.token, auth.secret)
    client
  end
  
  def build_profile omniauth
    omniauth['extra']['raw_info']['educations']['values'].each do |edu|
      start_date = edu['startDate']['year'] rescue nil
      end_date = edu['endDate']['year'] rescue nil
      self.educations.create!(:degree => edu['degree'],
                              :school_name => edu['schoolName'],
                              :field_of_study => edu['fieldOfStudy'],
                              :start_date => start_date,
                              :end_date => end_date,
                              :education_id => edu['id'])
    end
    omniauth['extra']['raw_info']['threeCurrentPositions']['values'].each do |pos|
      start_date = pos['startDate']['year'] rescue nil
      end_date = pos['endDate']['year'] rescue nil
      self.positions.create!(:company => pos['company']['name'],
                             :company_id => pos['company']['id'],
                             :title => pos['title'],
                             :is_current => pos['isCurrent'],
                             :position_id => pos['id'],
                             :start_date => start_date,
                             :end_date => end_date)
    end
    Rails.logger.info "Omniauth - adding positions..."
  end
  
  def full_name
    self.first_name + ' ' + self.last_name
  end

  def auth
    self.user.authentications.find_by_provider('linkedin')
  end
  
end
