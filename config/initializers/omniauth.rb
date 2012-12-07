Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linked_in, '3znaup2e1xk3', 'WnaqGyEvIYPKrBYQ', :scope => 'r_fullprofile r_emailaddress r_network', :fields => ["id", "email-address", "first-name", "last-name", "headline", "industry", "picture-url", "public-profile-url", "location", "connections", "educations", "three-current-positions"]
  provider :github, 'e8d2940401a7e79ddadc', '2349340d379830cb140f73f652b649432a2a5bca'#, :scope => "user,repo,gist"
  # provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
  # provider :facebook, 'APP_ID', 'APP_SECRET'
  LinkedIn.configure do |config|
    config.token = "8af68dd0-0427-4d6b-83f6-dea95291084e"
    config.secret = "a6b30960-db6b-4641-800f-8ac9eea5d9f6"
  end
end