class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :id_plan
      t.string :scan_path
    end
  end
end
