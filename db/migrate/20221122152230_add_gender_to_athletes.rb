class AddGenderToAthletes < ActiveRecord::Migration[7.0]
  def change
    add_column :athletes, :gender, :string
  end
end
