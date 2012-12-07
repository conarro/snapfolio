class CreateRepoItems < ActiveRecord::Migration
  def change
    create_table :repo_items do |t|
      t.integer :github_user_id
      t.integer :repo_id
      t.boolean :is_web_visible, :default => true
      t.boolean :is_print_visible, :default => true

      t.timestamps
    end
  end
end
