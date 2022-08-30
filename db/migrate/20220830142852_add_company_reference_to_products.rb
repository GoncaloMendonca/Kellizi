class AddCompanyReferenceToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :company
  end
end
