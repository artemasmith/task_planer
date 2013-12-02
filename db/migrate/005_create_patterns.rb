class CreatePatterns < ActiveRecord::Migration
  def change
    create_table :patterns do |t|
      t.string :header
      t.string :footer
      t.integer :id_department
      t.string :type
    end
  end
end
