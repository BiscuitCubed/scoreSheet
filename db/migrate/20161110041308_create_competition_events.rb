class CreateCompetitionEvents < ActiveRecord::Migration
  def change
    create_table :competition_events do |t|
      t.string :name
      t.integer :competition_id
      t.integer :num_competitors

      t.timestamps null: false
    end
  end
end
