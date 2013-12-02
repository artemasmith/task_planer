class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.integer :id_owner
      t.integer :id_performer
      t.string :scan_path
    end
  end
end
