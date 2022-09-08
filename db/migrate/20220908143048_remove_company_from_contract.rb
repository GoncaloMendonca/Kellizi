class RemoveCompanyFromContract < ActiveRecord::Migration[7.0]
  def change
    remove_column :contracts, :company_id
  end
end
