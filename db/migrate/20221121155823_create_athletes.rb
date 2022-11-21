class CreateAthletes < ActiveRecord::Migration[7.0]
  def change
    create_table :athletes do |t|
      t.string :first_name
      t.string :last_name
      t.integer :price_per_day
      t.integer :age
      t.string :location
      t.text :summary
      t.string :features
      t.string :sport
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
