class CreateConditions < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.string :condition_name

      t.timestamps
    end
  end
end
