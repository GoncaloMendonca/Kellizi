class CreateCoverages < ActiveRecord::Migration[7.0]
  def change
    create_table :coverages do |t|
      t.text :conditions
      t.text :description

      t.timestamps
    end
  end
end
