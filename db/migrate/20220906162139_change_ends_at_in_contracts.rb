class ChangeEndsAtInContracts < ActiveRecord::Migration[7.0]
  def change
    change_column :contracts, :ends_at, :date
  end
end
