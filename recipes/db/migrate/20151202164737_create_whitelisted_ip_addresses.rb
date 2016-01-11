class CreateWhitelistedIpAddresses < ActiveRecord::Migration
  def change
    create_table :whitelisted_ip_addresses do |t|
      t.string :ip_address
    end
  end
end
