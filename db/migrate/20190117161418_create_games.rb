class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.datetime :date
      t.string :away_team
      t.string :home_team
      t.string :city
      t.string :arena

      t.timestamps
    end
  end
end
