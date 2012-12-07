class SetDefaults < ActiveRecord::Migration
  def up
    change_column :education_items, :is_web_visible, :boolean, :default => true
    change_column :education_items, :is_print_visible, :boolean, :default => true
    change_column :position_items, :is_web_visible, :boolean, :default => true
    change_column :position_items, :is_print_visible, :boolean, :default => true
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't remove the default"
  end
end
