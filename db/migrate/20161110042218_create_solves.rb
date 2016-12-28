class CreateSolves < ActiveRecord::Migration
  def change
    create_table :solves do |t|
      t.string  :competitor_id
      t.string  :event_id
      t.integer :solve_time
      t.integer :solve_number
      t.string  :status

      t.timestamps null: false
    end
  end
end
