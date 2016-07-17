class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :manager_id
      t.string :phone
      t.string :email

      t.timestamps null: false
    end
  end
end
