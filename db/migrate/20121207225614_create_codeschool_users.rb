class CreateCodeschoolUsers < ActiveRecord::Migration
  def change
    create_table :codeschool_users do |t|
      t.integer :user_id
      t.string :username
      t.integer :score
      t.string :photo_url

      t.timestamps
    end
  end
end
