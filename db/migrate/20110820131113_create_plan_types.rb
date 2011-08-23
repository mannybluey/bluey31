class CreatePlanTypes < ActiveRecord::Migration
  def up
    rename_column :plans, :type_id, :plan_type_id
    create_table :plan_types do |t|
      t.string :name
      t.string :image_path
      t.integer :position
      t.boolean :status, :default => 1  # activated : 1
      t.timestamps
    end
  end

  def down
    rename_column :plans, :plan_type_id, :type_id
    drop_table :plan_types
  end
end
