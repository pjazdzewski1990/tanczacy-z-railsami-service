class CreateUserProxies < ActiveRecord::Migration
  def change
    create_table :user_proxies do |t|
      t.references :service
      t.string :uid
      t.string :token
      t.string :refresh
      t.date :date

      t.timestamps
    end
    add_index :user_proxies, :service_id
  end
end
