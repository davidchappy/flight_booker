class AddIndexToFlightDate < ActiveRecord::Migration[5.0]
  def change
    add_index :flights, :departure
  end
end
