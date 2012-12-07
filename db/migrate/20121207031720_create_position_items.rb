class CreatePositionItems < ActiveRecord::Migration
  def change
    create_table :position_items do |t|
      t.integer :linkedin_user_id
      t.integer :position_id
      t.boolean :is_web_visible
      t.boolean :is_print_visible

      t.timestamps
    end
  end
end
