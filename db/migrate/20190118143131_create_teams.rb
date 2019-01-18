class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :id_team
      t.string :stadium_img
      t.string :stadium_name
      t.string :stadium_location
      t.string :website
      t.string :logo
    end
  end
end
