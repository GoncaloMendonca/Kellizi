class ChangeStartsAtInContracts < ActiveRecord::Migration[7.0]
  def change
    change_column :contracts, :starts_at, :date, null: false
  end
end
