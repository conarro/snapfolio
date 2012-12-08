class CreateRecommendationItems < ActiveRecord::Migration
  def change
    create_table :recommendation_items do |t|
      t.integer :linkedin_user_id
      t.integer :recommendation_id
      t.boolean :is_web_visible
      t.boolean :is_print_visible

      t.timestamps
    end
  end
end
