class CreateStackexchangeUsers < ActiveRecord::Migration
  def change
    create_table :stackexchange_users do |t|
      t.integer :user_id
      t.string :username
      t.string :photo_url
      t.string :profile_url
      t.string :profile_id
      t.integer :reputation
      t.integer :gold_badge_count
      t.integer :silver_badge_count
      t.integer :bronze_badge_count

      t.timestamps
    end
  end
end
