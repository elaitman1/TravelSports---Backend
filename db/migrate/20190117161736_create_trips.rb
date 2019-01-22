class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.references :game, foreign_key: true
      t.references :user, foreign_key: true
      t.string :title
      t.references :hotel, foreign_key: true
      t.references :transportation, foreign_key: true

      t.timestamps
    end
  end
end
