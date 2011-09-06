class CreatePlanItemImages < ActiveRecord::Migration
    def up
    create_table :plan_item_images do |t|
      t.string :name
      t.integer :plan_item_id
      t.string  :image_file_name,  :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.timestamps
    end
  end

  def down
    drop_table :plan_item_images
  end

end
