class SetDefaultsForBadgeItem < ActiveRecord::Migration
  def up
    change_column :badge_items, :is_web_visible, :boolean, :default => true
    change_column :badge_items, :is_print_visible, :boolean, :default => true
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't remove the default"
  end
end
