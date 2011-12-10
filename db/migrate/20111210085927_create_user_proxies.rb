class CreateUserProxies < ActiveRecord::Migration
  def change
    create_table :user_proxies do |t|

      t.timestamps
    end
  end
end
