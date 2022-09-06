class AddAdressGenderFamilyStatusToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :gender, :text
    add_column :users, :family_status, :text
    add_column :users, :adress, :string
  end
end
