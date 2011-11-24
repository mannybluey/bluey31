class CreateUsersRoles < ActiveRecord::Migration
  def up
    create_table "roles_users", :id => false do |t|
      t.column "user_id", :integer, :null => false
      t.column "role_id", :integer, :null => false
    end
  end

  def down
  end
end
