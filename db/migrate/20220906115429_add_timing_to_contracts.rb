class AddTimingToContracts < ActiveRecord::Migration[7.0]
  def change
    add_column :contracts, :timing, :string
  end
end
