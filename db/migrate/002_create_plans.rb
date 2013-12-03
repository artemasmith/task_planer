class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.integer :id_owner
      t.integer :id_performer
      t.integer :id_department
      t.string :scan_path
      
      t.timestamps
    end
  end
end
