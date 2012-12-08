class CreateBadgeItems < ActiveRecord::Migration
  def change
    create_table :badge_items do |t|
      t.integer :codeschool_user_id
      t.integer :badge_id
      t.boolean :is_web_visible
      t.boolean :is_print_visible

      t.timestamps
    end
  end
end
