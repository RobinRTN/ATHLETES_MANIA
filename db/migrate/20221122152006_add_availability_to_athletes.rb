class AddAvailabilityToAthletes < ActiveRecord::Migration[7.0]
  def change
    add_column :athletes, :availability, :boolean, default: false
  end
end
