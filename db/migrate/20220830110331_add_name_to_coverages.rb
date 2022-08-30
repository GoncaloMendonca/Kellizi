class AddNameToCoverages < ActiveRecord::Migration[7.0]
  def change
    add_column :coverages, :name, :string
  end
end
