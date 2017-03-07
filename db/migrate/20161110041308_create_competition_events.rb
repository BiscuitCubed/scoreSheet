class CreateCompetitionEvents < ActiveRecord::Migration
  def change
    create_table :competition_events do |t|
      t.string :name
      t.integer :competition_id
      t.integer :num_competitors

      t.integer :e_3x3
      t.integer :e_2x2
      t.integer :e_skewb

      t.timestamps null: false
    end
  end
end
