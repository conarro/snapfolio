class CodeschoolUser < ActiveRecord::Base
  belongs_to :user
  has_many :badge_items
  has_many :badges, :through => :badge_items, :dependent => :destroy
  
  attr_accessible :photo_url, :score, :user_id, :username
  
  def build_profile
    data = HTTParty.get(self.api_url, :headers => {'Content-Type' => 'application/json'}).parsed_response
    score = data['user']['total_score']
    photo_url = data['user']['avatar']
    self.update_attributes(:score => score, :photo_url => photo_url)
    data['badges'].each do |badge|
      self.badges.create!(:name => badge['name'],
                          :url => badge['badge'],
                          :course_url => badge['course_url'])
    end
  end
  
  def api_url
    "http://www.codeschool.com/users/#{self.username}.json"
  end
  
end
