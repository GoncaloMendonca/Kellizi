class AddProductReferenceToContracts < ActiveRecord::Migration[7.0]
  def change
    add_reference :contracts, :product
  end
end
