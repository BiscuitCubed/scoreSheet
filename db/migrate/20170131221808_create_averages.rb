class CreateAverages < ActiveRecord::Migration
  def change
    create_table :averages do |t|
      t.integer :time
      t.integer :competitor_id
      t.integer :round_id
      t.timestamps null: false
    end
  end
end
