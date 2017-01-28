class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|

      t.integer  :round_number
      t.integer :competition_event_id

      t.timestamps null: false
    end
  end
end
