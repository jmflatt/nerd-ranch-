class CreateAdminWhitelists < ActiveRecord::Migration
  def change
    create_table :admin_whitelists do |t|
      t.string :remote_ip

      t.timestamps
    end
  end
end
