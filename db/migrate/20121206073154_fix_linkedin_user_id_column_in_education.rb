class FixLinkedinUserIdColumnInEducation < ActiveRecord::Migration
  def up
    rename_column :educations, :linked_user_id, :linkedin_user_id
  end

  def down
    rename_column :educations, :linkedin_user_id, :linked_user_id
  end
end
