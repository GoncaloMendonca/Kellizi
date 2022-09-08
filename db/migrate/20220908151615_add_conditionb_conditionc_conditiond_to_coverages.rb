class AddConditionbConditioncConditiondToCoverages < ActiveRecord::Migration[7.0]
  def change
    add_column :coverages, :conditionb, :text
    add_column :coverages, :conditionc, :text
    add_column :coverages, :conditiond, :text
  end
end
