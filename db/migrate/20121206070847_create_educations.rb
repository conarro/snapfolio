class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.integer :linked_user_id
      t.string :degree
      t.string :field_of_study
      t.datetime :start_date
      t.datetime :end_date
      t.string :school_name
      t.string :education_id

      t.timestamps
    end
  end
end
