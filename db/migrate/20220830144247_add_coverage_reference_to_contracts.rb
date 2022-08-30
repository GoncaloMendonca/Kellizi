class AddCoverageReferenceToContracts < ActiveRecord::Migration[7.0]
  def change
    add_reference :contracts, :coverage
  end
end
