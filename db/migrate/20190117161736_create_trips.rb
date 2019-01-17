class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.references :game, foreign_key: true
      t.references :user, foreign_key: true
      t.string :title
      t.string :hotel
      t.string :transportation

      t.timestamps
    end
  end
end
