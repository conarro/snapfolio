class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.string :recommendation_id
      t.string :type
      t.string :text
      t.string :recommender

      t.timestamps
    end
  end
end
