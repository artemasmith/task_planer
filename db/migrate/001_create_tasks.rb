class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :id_user
      t.integer :id_plan
      t.string :task
      t.datetime :plan_finish_time
      t.datetime :finish_time
      t.datetime :aquaiant_time
      t.boolean :status
      
      t.timestamps
    end
#    add_index :tasks, :id_user
#    add_index :tasks, [:task, :id_user]
    add_index :tasks, [:id_user, :id_plan]
  end
end
