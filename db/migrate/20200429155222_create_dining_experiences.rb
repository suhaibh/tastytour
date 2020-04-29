class CreateDiningExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :dining_experiences do |t|
      t.references :user, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true
      t.date :date
      t.text :review
      t.integer :rating
      t.integer :price

      t.timestamps
    end
  end
end
