class AddUserIdToLinkedinUser < ActiveRecord::Migration
  def change
    add_column :linkedin_users, :user_id, :integer
  end
end
