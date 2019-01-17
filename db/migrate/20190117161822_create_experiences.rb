class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.references :trip, foreign_key: true
      t.string :img_url
      t.string :review
      t.integer :rating

      t.timestamps
    end
  end
end
