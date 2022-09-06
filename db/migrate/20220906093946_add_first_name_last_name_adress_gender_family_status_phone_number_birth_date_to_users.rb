class AddFirstNameLastNameAdressGenderFamilyStatusPhoneNumberBirthDateToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :birth_date, :date
    add_column :users, :family_status, :integer
    add_column :users, :gender, :integer
  end
end
