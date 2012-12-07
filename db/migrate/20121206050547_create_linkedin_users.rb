class CreateLinkedinUsers < ActiveRecord::Migration
  def change
    create_table :linkedin_users do |t|
      t.string :first_name
      t.string :last_name
      t.string :headline
      t.string :photo_url
      t.string :email
      t.string :industry
      t.string :profile_url
      t.string :location_name
      t.string :location_country
      t.string :profile_id

      t.timestamps
    end
  end
end
