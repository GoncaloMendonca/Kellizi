class RemoveAdressFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :adress, :string
  end
end
