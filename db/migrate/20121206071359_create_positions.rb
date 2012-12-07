class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.integer :linked_user_id
      t.string :title
      t.string :company
      t.string :company_id
      t.boolean :is_current
      t.string :position_id
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
