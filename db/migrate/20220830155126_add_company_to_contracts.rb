class AddCompanyToContracts < ActiveRecord::Migration[7.0]
  def change
    add_reference :contracts, :company, null: false, foreign_key: true
  end
end
