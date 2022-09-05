class ChangeProductIdInContracts < ActiveRecord::Migration[7.0]
  def change
    change_column :contracts, :product_id, :bigint, null: false
  end
end
