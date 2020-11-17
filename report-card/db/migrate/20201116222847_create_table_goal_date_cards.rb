class CreateTableGoalDateCards < ActiveRecord::Migration
  def change
    create_table :goal_date_cards do |t|
      t.integer :goal_id
      t.integer :datecard_id
      t.string :binary_completed
      t.integer :qty_completed
    end
  end
end
