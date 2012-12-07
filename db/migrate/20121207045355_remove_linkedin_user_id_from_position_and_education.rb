class RemoveLinkedinUserIdFromPositionAndEducation < ActiveRecord::Migration
  def up
    remove_column :educations, :linkedin_user_id
    remove_column :positions, :linkedin_user_id
  end

  def down
    add_column :educations, :linkedin_user_id, :integer
    add_column :positions, :linkedin_user_id, :integer
  end
end
