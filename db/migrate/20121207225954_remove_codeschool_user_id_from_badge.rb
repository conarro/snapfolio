class RemoveCodeschoolUserIdFromBadge < ActiveRecord::Migration
  def up
    remove_column :badges, :codeschool_user_id
  end

  def down
    add_column :badges, :codeschool_user_id, :integer
  end
end
