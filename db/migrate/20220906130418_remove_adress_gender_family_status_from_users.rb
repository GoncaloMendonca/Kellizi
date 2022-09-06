class RemoveAdressGenderFamilyStatusFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :gender, :integer
    remove_column :users, :family_status, :integer
    remove_column :users, :adress, :string
  end
end
