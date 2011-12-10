class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :website
      t.integer :priority
      t.integer :interval

      t.timestamps
    end
  end
end
