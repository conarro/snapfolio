class AddRepoCreatedAtToRepo < ActiveRecord::Migration
  def change
    add_column :repos, :repo_created_at, :datetime
  end
end
