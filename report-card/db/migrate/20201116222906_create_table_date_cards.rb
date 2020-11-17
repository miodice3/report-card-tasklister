class CreateTableDateCards < ActiveRecord::Migration
  def change
    create_table :date_cards do |t|
      t.integer :user_id
      t.text :date
    end
  end
end
