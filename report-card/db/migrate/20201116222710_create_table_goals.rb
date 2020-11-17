class CreateTableGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :user_id
      t.string :goal_name
      t.string :goal_frequency
      t.string :goal_type
      t.integer :goal_qty
    end
  end
end
