class CreateContracts < ActiveRecord::Migration[7.0]
  def change
    create_table :contracts do |t|
      t.integer :price
      t.integer :source
      t.datetime :starts_at
      t.datetime :ends_at
      t.boolean :status

      t.timestamps
    end
  end
end
