class UpdateAvailabilityToAthletes < ActiveRecord::Migration[7.0]
  def change
    change_column :athletes, :availability, :boolean, default: true
  end
end
