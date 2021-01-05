class Dates < ActiveRecord::Migration
  def change
    create_table :dates do |t|
      t.string :goal_completed_1
      t.string :goal_qty_1

      t.string :goal_completed_2
      t.string :goal_qty_2

      t.string :goal_completed_3
      t.string :goal_qty_3
    end
  end
end