class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos do |t|
      t.string :repo_id
      t.string :name
      t.string :description
      t.string :url
      t.datetime :created_at
      t.datetime :pushed_at

      t.timestamps
    end
  end
end
