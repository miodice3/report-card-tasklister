class Users < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :password_digest

      t.string :goal_enabled_1
      t.string :goal_name_1
      t.string :goal_frequency_1
      t.string :goal_type_1
      t.integer :goal_qty_1
      
      t.string :goal_enabled_2
      t.string :goal_name_2
      t.string :goal_frequency_2
      t.string :goal_type_2
      t.integer :goal_qty_2

      t.string :goal_enabled_3
      t.string :goal_name_3
      t.string :goal_frequency_3
      t.string :goal_type_3
      t.integer :goal_qty_3
    end
  end
end
