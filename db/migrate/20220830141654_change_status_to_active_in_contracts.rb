class ChangeStatusToActiveInContracts < ActiveRecord::Migration[7.0]
  def change
    rename_column :contracts, :status, :active
  end
end
