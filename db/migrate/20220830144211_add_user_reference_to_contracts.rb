class AddUserReferenceToContracts < ActiveRecord::Migration[7.0]
  def change
    add_reference :contracts, :user
  end
end
