class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.string :body
      t.string :link
      t.date :published
      t.references :userProxy
      t.references :service

      t.timestamps
    end
    add_index :resources, :userProxy_id
    add_index :resources, :service_id
  end
end
