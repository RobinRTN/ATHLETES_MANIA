class AddCoordinatesToAthletes < ActiveRecord::Migration[7.0]
  def change
    add_column :athletes, :latitude, :float
    add_column :athletes, :longitude, :float
  end
end
