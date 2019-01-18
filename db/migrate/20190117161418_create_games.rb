class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.datetime :date
      t.string :away_team_id
      t.string :home_team_id

      t.timestamps
    end
  end
end
