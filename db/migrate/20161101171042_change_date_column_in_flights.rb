class ChangeDateColumnInFlights < ActiveRecord::Migration[5.0]
  def change
    change_column :flights, :departure, :date
  end
end
