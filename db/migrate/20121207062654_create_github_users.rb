class CreateGithubUsers < ActiveRecord::Migration
  def change
    create_table :github_users do |t|
      t.string :username
      t.string :photo_url
      t.string :profile_url
      t.string :profile_id
      t.integer :user_id

      t.timestamps
    end
  end
end
