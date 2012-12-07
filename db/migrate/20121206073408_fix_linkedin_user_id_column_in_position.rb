class FixLinkedinUserIdColumnInPosition < ActiveRecord::Migration
  def up
    rename_column :positions, :linked_user_id, :linkedin_user_id
  end

  def down
    rename_column :positions, :linkedin_user_id, :linked_user_id
  end
end
