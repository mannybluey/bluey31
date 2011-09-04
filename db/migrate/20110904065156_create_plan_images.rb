class CreatePlanImages < ActiveRecord::Migration
  def change
    create_table :plan_images do |t|
      t.string :name
      t.integer :plan_id
      t.string  :image_file_name,  :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.timestamps
    end
  end
end
