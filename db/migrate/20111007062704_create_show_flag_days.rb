class CreateShowFlagDays < ActiveRecord::Migration
  def up
    add_column :days, :show_flag, :boolean, :default => false
  end

  def down
    remove_column :days, :show_flag
  end
end
