class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.integer :codeschool_user_id
      t.string :name
      t.string :url
      t.string :course_url

      t.timestamps
    end
  end
end
