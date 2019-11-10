class CreateAdminUsersRoles < ActiveRecord::Migration[6.0]
  def change
    create_join_table :roles, :admin_users do |t|
      t.index [:admin_user_id, :role_id]
      t.index [:role_id, :admin_user_id]
    end
  end
end
